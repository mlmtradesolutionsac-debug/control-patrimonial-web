# 📑 Índice de Tests - Control Patrimonial Web

## 📚 Documentación

### 1. **RESUMEN_TESTS.md** ⭐ LEER PRIMERO
- **Contenido:** Resumen ejecutivo completo
- **Extensión:** 300+ líneas
- **Para:** Visión general de todo lo entregado
- **Lectura:** 5-10 minutos

### 2. **TESTS_README.md** ⭐ GUÍA PRINCIPAL
- **Contenido:** Guía completa de uso
- **Extensión:** 500+ líneas
- **Incluye:**
  - Estructura de tests
  - Cómo ejecutar tests
  - Categorías de tests
  - Fixtures disponibles
  - Markers
  - Troubleshooting
  - CI/CD
- **Para:** Usar y entender los tests
- **Lectura:** 15-20 minutos

### 3. **DEPLOYMENT_TESTS.md** 🚀 DEPLOYMENT
- **Contenido:** Guía de deployment en servidor
- **Para:** Pasar tests a producción
- **Incluye:**
  - Setup en servidor
  - Automatización
  - Monitoreo
  - Próximas acciones

### 4. **pytest.ini** ⚙️ CONFIGURACIÓN
- **Tipo:** Archivo de configuración
- **Ubicación:** Raíz del proyecto
- **Función:** Configurar comportamiento de pytest

---

## 🧪 Archivos de Tests

### Estructura

```
tests/
├── __init__.py                 # Inicialización
├── conftest.py                 # Configuración y fixtures (110 líneas)
├── test_auth.py               # Tests de autenticación (230 líneas)
├── test_api.py                # Tests de API (280 líneas)
└── test_import_export.py       # Tests de Excel (260 líneas)
```

### Contenido por Archivo

#### **conftest.py** (Fixtures)
```python
@pytest.fixture
def app:              # Aplicación Flask
def client:           # Cliente HTTP
def db_session:       # Sesión BD
def user_admin:       # Usuario admin
def user_app:         # Usuario operador
```

#### **test_auth.py** (10 tests)
- TestAuthenticationRoutes (6 tests)
- TestUserModels (4 tests)
- TestAuthSecurity (4 tests)

Cubre: Login, logout, cambio contraseña, seguridad (XSS, SQL injection)

#### **test_api.py** (27 tests)
- TestAPIBienes (9 tests)
- TestAPIValidation (6 tests)
- TestAPICORSHeaders (2 tests)
- TestAPIFiltering (6 tests)
- TestAPIEdgeCases (4 tests)

Cubre: CRUD, paginación, filtrado, validación, manejo de errores

#### **test_import_export.py** (28 tests)
- TestImportService (7 tests)
- TestExportService (6 tests)
- TestDataValidation (5 tests)
- TestImportExportIntegration (2 tests)

Cubre: Importación, exportación, validación, UTF-8

---

## 🚀 Scripts de Automatización

### **run_tests_remote.bat** (Windows)
```batch
run_tests_remote.bat
```
- Verifica conexión a servidor
- Sincroniza tests
- Ejecuta suite
- Genera cobertura

### **run_tests_remote.sh** (Linux/macOS)
```bash
bash run_tests_remote.sh
```
- Mismo funcionamiento que .bat
- Compatible con sistemas Unix

---

## 📊 Resumen Ejecutivo

| Métrica | Valor |
|---------|-------|
| **Tests Totales** | 65 |
| **Líneas de Código** | 803 |
| **Archivos de Tests** | 4 |
| **Cobertura** | 29% |
| **Tests Pasando** | 65/65 (100%) |
| **Tiempo Ejecución** | ~10 seg (local) |
| | ~173 seg (servidor) |

---

## 🎯 Cómo Empezar

### 1️⃣ Lectura
```
RESUMEN_TESTS.md        → Entender qué se hizo
    ↓
TESTS_README.md         → Aprender a usar
```

### 2️⃣ Instalación Local
```bash
pip install -r requirements.dev.txt
pytest tests/ -v
```

### 3️⃣ Deployment en Servidor
```
DEPLOYMENT_TESTS.md     → Seguir instrucciones
    ↓
./run_tests_remote.bat  → Ejecutar
```

---

## 📋 Casos de Uso

### Desarrollo
```bash
# Ejecutar todos
pytest tests/ -v

# Con cobertura
pytest tests/ --cov=app --cov-report=html

# Un archivo específico
pytest tests/test_auth.py -v

# Un test específico
pytest tests/test_auth.py::TestAuthenticationRoutes::test_login_page_get -v
```

### Producción
```bash
# Windows
run_tests_remote.bat

# Linux
bash run_tests_remote.sh
```

### CI/CD
Ver sección de CI/CD en `TESTS_README.md`

---

## 🔍 Desglose de Tests

### Fase 1: Autenticación
- Login/Logout
- Cambio de contraseña
- Creación de usuarios
- Hash de contraseñas
- Seguridad (CSRF, XSS, SQL injection)

### Fase 2: API
- Listar bienes
- Obtener detalles
- Crear bien
- Paginación
- Filtrado
- Validación
- Casos límite

### Fase 3: Importación/Exportación
- Importación Excel
- Exportación (Excel, CSV, PDF)
- Validación de datos
- Caracteres especiales
- Datasets grandes
- Round-trip

---

## ⚙️ Configuración

### pytest.ini
```ini
[pytest]
testpaths = tests
python_files = test_*.py
python_classes = Test*
python_functions = test_*
addopts = -v --tb=short
```

### Markers Disponibles
```bash
pytest tests/ -m unit           # Unitarios
pytest tests/ -m integration    # Integración
pytest tests/ -m auth           # Autenticación
pytest tests/ -m api            # API
pytest tests/ -m import_export  # Importación
pytest tests/ -m security       # Seguridad
```

---

## 📈 Cobertura

```
Módulo                  Cobertura   Estado
────────────────────────────────────────────
models_sqlalchemy.py       81%      ✅
__init__.py                66%      ✅
auth/routes.py             43%      ⚠️
api/routes.py              26%      ⚠️
repository.py              23%      ⚠️
────────────────────────────────────────────
TOTAL                      29%
```

---

## 🔧 Fixtures

Todas definidas en `conftest.py`:

```python
app          # Aplicación Flask con BD temporal
client       # Cliente HTTP para requests
db_session   # Sesión de BD
user_admin   # Usuario administrador pre-creado
user_app     # Usuario operador pre-creado
login_admin  # Cliente autenticado como admin
login_user_app # Cliente autenticado como usuario
```

---

## 🆘 Soporte

### Problemas Comunes

**Error: "No module named 'pytest'"**
```bash
pip install -r requirements.dev.txt
```

**Tests lentos**
```bash
pytest tests/ -x  # Para en primer error
```

**Ver traceback completo**
```bash
pytest tests/ --tb=long
```

Para más, ver sección "Troubleshooting" en `TESTS_README.md`

---

## 📞 Contacto

- **Documentación:** pytest.org
- **Guía Local:** TESTS_README.md
- **Deployment:** DEPLOYMENT_TESTS.md
- **Resumen:** RESUMEN_TESTS.md

---

## 📝 Checklist de Uso

- [ ] Leí RESUMEN_TESTS.md
- [ ] Leí TESTS_README.md
- [ ] Instalé dependencias (pip install -r requirements.dev.txt)
- [ ] Ejecuté tests locales (pytest tests/ -v)
- [ ] Verifiqué cobertura (pytest --cov=app --cov-report=html)
- [ ] Deployé en servidor (run_tests_remote.bat o .sh)
- [ ] Agregué tests propios según necesidades

---

**Creado:** 4 de Diciembre de 2025
**Versión:** 1.0
**Estado:** ✅ Listo para usar
