# PLAN DE MEJORAS SECUNDARIAS - v1.3

**Fecha**: 27 de Noviembre de 2025
**Estado**: PLANIFICACIÓN
**Versión actual**: 1.2 (post-refactorización)

---

## 📋 EVALUACIÓN DE VIABILIDAD

### 1. OPTIMIZACIÓN DE BASE DE DATOS

#### 1.1 Índices Adicionales
**Estado actual**: Hay índices básicos en modelos_sqlalchemy.py
**Viabilidad**: ✅ ALTO (cambio simple, bajo riesgo)
**Tiempo estimado**: 30 minutos
**Complejidad**: Baja

**Índices a agregar:**
```python
# En models_sqlalchemy.py - clase Bien
Index('idx_bien_usuario_registro', Bien.usuario_registro)
Index('idx_bien_fecha_registro', Bien.fecha_registro)
Index('idx_bien_cal_2025', Bien.cal_2025)
Index('idx_historial_bien_usuario', Historial.bien_id, Historial.usuario)
Index('idx_bien_estado_sede', Bien.estado, Bien.sede_id)
```

**Beneficio esperado**:
- Búsquedas por usuario: +30-50%
- Filtros por fecha: +20-30%
- Consultas CAL 2025: +40-60%

**Riesgo**: BAJO (índices son aditivos, no destructivos)

---

#### 1.2 Connection Pooling
**Estado actual**: Sin pooling (cada request crea conexión)
**Viabilidad**: ✅ ALTO (soporte nativo en SQLAlchemy)
**Tiempo estimado**: 20 minutos
**Complejidad**: Baja

**Implementación:**
```python
# En app/__init__.py o config.py
app.config['SQLALCHEMY_ENGINE_OPTIONS'] = {
    'pool_size': 10,           # Máximo de conexiones activas
    'pool_recycle': 3600,      # Reciclar conexiones cada 1 hora
    'pool_pre_ping': True,     # Verificar conexión antes de usar
    'max_overflow': 20,        # Conexiones adicionales si necesario
}
```

**Beneficio esperado**:
- Reducción tiempo espera: 50-70%
- Mejor manejo de picos: Sí
- Recursos compartidos: Sí

**Riesgo**: BAJO (SQLAlchemy maneja esto automáticamente)

---

### 2. CACHING

#### 2.1 Estadísticas (Lectura frecuente, cambio lento)
**Estado actual**: Sin caching
**Viabilidad**: ✅ ALTO (cambio simple)
**Tiempo estimado**: 45 minutos
**Complejidad**: Media

**Datos candidatos para cache:**
- `obtener_progreso_cal_2025()` - Calcula cada request
- `obtener_progreso_por_sede()` - 15 sedes, no cambia rápido
- `obtener_progreso_por_dependencia()` - 146 unidades
- `obtener_resumen_completo()` - Agregación de todo

**Tiempo de vida sugerido:**
- Estadísticas: 5-15 minutos (depende de actualización frecuencia)
- Sedes/Unidades: 1 hora (nunca cambia en runtime)

**Implementación:**
```python
from flask_caching import Cache

cache = Cache(app, config={'CACHE_TYPE': 'simple'})  # O 'redis'

@cache.cached(timeout=600)  # 10 minutos
def obtener_progreso_cal_2025(self):
    ...
```

**Beneficio esperado**:
- Dashboard carga: 70-80% más rápido
- Estadísticas: 50-90% más rápidas
- CPU reducido: 30-40%

**Riesgo**: BAJO-MEDIO (invalidación de cache es crítica)

---

#### 2.2 Redis vs Flask Cache
**Comparativa:**

| Aspecto | Flask Cache | Redis |
|---------|------------|-------|
| Setup | 5 minutos | 30 minutos |
| Performance | Bueno (RAM) | Excelente |
| Persistencia | No | Sí |
| Escalabilidad | Limitada | Excelente |
| Producción | Sí | Recomendado |
| Costo | Gratis | Gratis (self-hosted) |

**Recomendación**: Flask Cache para v1.3, Redis para v2.0

---

### 3. MANEJO DE ARCHIVOS

#### 3.1 Subida de Archivos
**Estado actual**: No hay funcionalidad
**Viabilidad**: ✅ MEDIO (requiere cambios estructurales)
**Tiempo estimado**: 2-3 horas
**Complejidad**: Media-Alta

**Arquitectura propuesta:**
```
app/
├── uploads/                  # Nuevo directorio
│   ├── images/              # Imágenes de bienes
│   ├── documents/           # Documentos
│   └── temp/                # Archivos temporales
├── models_sqlalchemy.py     # Agregar campo para archivo
├── utils.py                 # Agregar validación de archivo
└── main/routes.py           # Agregar endpoint de upload
```

**Validaciones necesarias:**
- Tipos permitidos: PNG, JPG, PDF (configurable)
- Tamaño máximo: 5MB por archivo
- Virus scan: Opcional (ClamAV)
- Almacenamiento: Local o S3

**Riesgo**: MEDIO (seguridad de archivos es crítica)

---

#### 3.2 Modelo de datos para archivos
**Nuevo modelo:**
```python
class ArchivosBien(db.Model):
    __tablename__ = 'archivos_bienes'

    id = db.Column(db.Integer, primary_key=True)
    bien_id = db.Column(db.Integer, db.ForeignKey('bienes.id'), nullable=False)
    nombre_original = db.Column(db.String(255))
    nombre_almacenado = db.Column(db.String(255), unique=True)
    tipo_mime = db.Column(db.String(50))
    tamaño = db.Column(db.Integer)
    ruta = db.Column(db.String(500))
    fecha_upload = db.Column(db.DateTime, default=datetime.now)
    usuario_upload = db.Column(db.String(50))
```

---

### 4. PAGINACIÓN MEJORADA

#### 4.1 Estado actual
```html
<!-- Paginación simple -->
<nav>
  <a href="?page=1">Anterior</a>
  <span>Página 3 de 640</span>
  <a href="?page=4">Siguiente</a>
</nav>
```

**Problemas:**
- No muestra total de resultados
- No permite elegir items/página
- Saltos grandes entre páginas difíciles

#### 4.2 Mejoras propuestas
**Viabilidad**: ✅ ALTO (cambios en frontend)
**Tiempo estimado**: 1-2 horas
**Complejidad**: Baja

**Componentes nuevos:**
```html
<!-- Selector de items por página -->
<select name="per_page">
  <option value="10">10 por página</option>
  <option value="20" selected>20 por página</option>
  <option value="50">50 por página</option>
  <option value="100">100 por página</option>
</select>

<!-- Información mejorada -->
<div class="pagination-info">
  Mostrando 21-40 de 12,808 resultados
  <span class="page-size">20 por página</span>
</div>

<!-- Paginación con números -->
<nav class="pagination">
  <a href="?page=1" class="first">«</a>
  <a href="?page=2" class="prev">‹</a>

  <a href="?page=1">1</a>
  <a href="?page=2">2</a>
  <strong>3</strong>
  <a href="?page=4">4</a>
  <a href="?page=5">5</a>

  <a href="?page=4" class="next">›</a>
  <a href="?page=640" class="last">»</a>
</nav>
```

---

## 📊 MATRIZ DE PRIORIDAD

| Mejora | Impacto | Complejidad | Tiempo | Prioridad |
|--------|---------|-------------|--------|-----------|
| **1.1 Índices BD** | Alto | Baja | 30min | ⭐⭐⭐ |
| **1.2 Connection Pooling** | Medio | Baja | 20min | ⭐⭐⭐ |
| **2.1 Caching** | Alto | Media | 45min | ⭐⭐⭐ |
| **4.1 Paginación** | Medio | Baja | 2h | ⭐⭐ |
| **3.1 Archivos** | Medio | Alta | 3h | ⭐ |

---

## 🗓️ CRONOGRAMA RECOMENDADO

### Fase 1: Rápidas (1 hora) - Implementar primero
- ✅ Índices BD (30 min)
- ✅ Connection Pooling (20 min)
- ✅ Testing (10 min)

### Fase 2: Caching (1-2 horas)
- ✅ Caching de estadísticas (45 min)
- ✅ Invalidación de cache (30 min)
- ✅ Testing (15 min)

### Fase 3: Paginación (2 horas)
- ✅ Frontend mejorado (2 horas)
- ✅ Testing manual (30 min)

### Fase 4: Archivos (OPCIONAL - Futura)
- Mejor hacerlo en v2.0 (más tiempo disponible)
- Requiere decisiones sobre almacenamiento

---

## 💾 PLAN DETALLADO POR MEJORA

### A. ÍNDICES (30 min)

**Paso 1: Agregar índices a modelos_sqlalchemy.py**
```python
from sqlalchemy import Index

class Bien(db.Model):
    # ... campos existentes ...

    # Índices
    __table_args__ = (
        Index('idx_bien_usuario_registro', 'usuario_registro'),
        Index('idx_bien_fecha_registro', 'fecha_registro'),
        Index('idx_bien_cal_2025', 'cal_2025'),
        Index('idx_bien_estado_sede', 'estado', 'sede_id'),
    )
```

**Paso 2: Crear migration (opcional, pero recomendado)**
```bash
flask db migrate -m "Add database indexes for performance"
flask db upgrade
```

**Paso 3: Verificar índices**
```bash
sqlite3 data/inventario_patrimonial.db ".indexes bienes"
```

---

### B. CONNECTION POOLING (20 min)

**Modificar config.py:**
```python
class ProductionConfig(Config):
    SQLALCHEMY_ENGINE_OPTIONS = {
        'pool_size': 10,
        'pool_recycle': 3600,
        'pool_pre_ping': True,
        'max_overflow': 20,
    }

class DevelopmentConfig(Config):
    SQLALCHEMY_ENGINE_OPTIONS = {
        'pool_size': 5,
        'pool_recycle': 1800,
        'pool_pre_ping': True,
    }
```

---

### C. CACHING (45 min)

**Paso 1: Instalar Flask-Caching**
```bash
pip install Flask-Caching
```

**Paso 2: Configurar en app/__init__.py**
```python
from flask_caching import Cache

cache = Cache(app, config={
    'CACHE_TYPE': 'simple',
    'CACHE_DEFAULT_TIMEOUT': 300
})
```

**Paso 3: Agregar decoradores**
```python
@cache.cached(timeout=600)
def obtener_progreso_cal_2025(self):
    ...
```

**Paso 4: Invalidar cache cuando se actualiza bien**
```python
@cache.invalidate_when_changed('obtener_progreso_cal_2025')
def actualizar_bien(bien_id, data, usuario):
    ...
```

---

### D. PAGINACIÓN MEJORADA (2 horas)

**Cambios en template:**
```html
<!-- Selector de items por página -->
<form method="GET" class="pagination-controls">
  <select name="per_page" onchange="this.form.submit()">
    <option value="10">10</option>
    <option value="20" selected>20</option>
    <option value="50">50</option>
  </select>
</form>

<!-- Información y navegación mejorada -->
<div class="pagination-info">
  Mostrando {{ inicio }}-{{ fin }} de {{ total }} resultados
</div>
```

---

## 🎯 RECOMENDACIÓN FINAL

**Fase 1 (Hoy)**: Implementar Índices + Connection Pooling
- Impacto: Inmediato en performance
- Riesgo: Muy bajo
- Tiempo: 1 hora

**Fase 2 (Próxima semana)**: Caching + Paginación
- Impacto: Alto en UX y performance
- Riesgo: Bajo
- Tiempo: 3 horas

**Fase 3 (v2.0)**: Manejo de archivos
- Impacto: Alto en funcionalidad
- Riesgo: Medio
- Tiempo: 3-4 horas

---

## ✅ CHECKLIST PRE-IMPLEMENTACIÓN

Antes de empezar:
- [ ] Backup de BD (`cp data/inventario_patrimonial.db data/inventario_patrimonial.db.BACKUP_v1.3`)
- [ ] Tests actuales pasan (29/29)
- [ ] Rama git nueva: `git checkout -b feature/performance-v1.3`
- [ ] Documentación del cambio
- [ ] Plan de rollback

---

**¿Deseas proceder con Fase 1 (Índices + Connection Pooling)?**

Estimado: 1 hora de trabajo
Impacto: Performance +30-50%
Riesgo: Muy bajo
