# INSTRUCCIONES FASE 0 - PREPARACIÓN UBUNTU

**Tiempo estimado**: 30 minutos
**Dificultad**: ⭐ FÁCIL (ejecutar script)
**Riesgo**: 🟢 BAJO (no modifica datos, solo instala)

---

## 🚀 CÓMO EJECUTAR FASE 0

### Opción 1: Script automático (RECOMENDADO - 30 min)

**Paso 1: Conectate a tu servidor Ubuntu**

```bash
ssh usuario@tu-servidor-ubuntu
# O si usas contraseña:
ssh usuario@IP_DEL_SERVIDOR
```

**Paso 2: Descarga el script de instalación**

```bash
# Opción A: Si tienes git clone
cd /tmp
git clone https://github.com/tu-usuario/control_patrimonial.git
cd control_patrimonial
# O copiar manualmente el archivo: SCRIPTS_FASE0_INSTALACION.sh

# Opción B: Si descargas el script directamente
wget https://raw.github.com/tu-usuario/control_patrimonial/main/SCRIPTS_FASE0_INSTALACION.sh
# O copiar/pegar el contenido del archivo en: SCRIPTS_FASE0_INSTALACION.sh
```

**Paso 3: Ejecuta el script**

```bash
sudo bash SCRIPTS_FASE0_INSTALACION.sh
```

**El script hará automáticamente:**
- ✅ Verificar pre-requisitos
- ✅ Actualizar sistema
- ✅ Instalar Python 3.10, PostgreSQL, Postfix, Nginx, etc.
- ✅ Crear usuario `patrimonial`
- ✅ Crear directorios
- ✅ Crear entorno virtual Python
- ✅ Configurar Postfix
- ✅ Generar .env con SECRET_KEY segura
- ✅ Crear scripts de backup y monitoreo

**Tiempo**: 20-30 minutos (depende de la velocidad de internet)

---

### Opción 2: Manual (si el script falla)

Si el script automático no funciona, ejecuta los pasos manualmente:

#### Paso 2.1: Actualizar sistema

```bash
sudo apt-get update
sudo apt-get upgrade -y
```

#### Paso 2.2: Instalar dependencias

```bash
sudo apt-get install -y \
    python3.10 \
    python3.10-venv \
    python3-pip \
    git \
    postgresql \
    postgresql-contrib \
    postfix \
    mailutils \
    sqlite3 \
    nginx \
    certbot \
    build-essential \
    libssl-dev \
    libffi-dev
```

#### Paso 2.3: Crear usuario

```bash
sudo useradd -m -s /bin/bash patrimonial
sudo usermod -aG sudo patrimonial
```

#### Paso 2.4: Crear directorios

```bash
sudo mkdir -p /opt/control_patrimonial
sudo mkdir -p /opt/control_patrimonial/{data,uploads/import,uploads/documents,scripts,logs}
sudo mkdir -p /backups/control_patrimonial
sudo mkdir -p /var/log/control_patrimonial

sudo chown -R patrimonial:patrimonial /opt/control_patrimonial
sudo chown -R patrimonial:patrimonial /backups/control_patrimonial
sudo chown -R patrimonial:patrimonial /var/log/control_patrimonial
```

#### Paso 2.5: Crear entorno virtual

```bash
cd /opt/control_patrimonial
python3.10 -m venv venv
source venv/bin/activate
pip install --upgrade pip setuptools wheel
pip install flask flask-sqlalchemy flask-login
```

#### Paso 2.6: Configurar Postfix

```bash
sudo dpkg-reconfigure postfix
# Seleccionar: "Internet Site"
# Nombre del servidor: tu-servidor.com (o localhost)
```

---

## ✅ VERIFICAR QUE FASE 0 FUNCIONÓ

Después de ejecutar el script (o pasos manuales), verifica:

```bash
# 1. Verificar usuario existe
id patrimonial
# Esperado: uid=X gid=Y

# 2. Verificar directorios
ls -la /opt/control_patrimonial/
# Esperado: venv, data, uploads, scripts, logs

# 3. Verificar Python
/opt/control_patrimonial/venv/bin/python --version
# Esperado: Python 3.10.x

# 4. Verificar pip
/opt/control_patrimonial/venv/bin/pip list | head
# Esperado: pip, setuptools, wheel, flask, etc.

# 5. Verificar .env existe
ls -la /opt/control_patrimonial/.env
# Esperado: -rw------- 1 patrimonial patrimonial (archivo con permisos 600)

# 6. Verificar Postfix
sudo systemctl status postfix
# Esperado: active (running)

# 7. Verificar Nginx
sudo systemctl status nginx
# Esperado: active (running) o inactive (stopped - se inicia en Fase 5)
```

---

## 📋 CHECKLIST FASE 0

```
PRE-EJECUCIÓN:
  [ ] Tengo acceso SSH al servidor Ubuntu
  [ ] El servidor tiene conexión a internet
  [ ] Tengo espacio de disco (mínimo 5GB libres)
  [ ] Soy usuario root o tengo sudo

DURANTE LA EJECUCIÓN:
  [ ] Script ejecutándose sin errores
  [ ] Ver mensajes verdes [✓] en la salida
  [ ] No ver mensajes rojos [✗] críticos
  [ ] Esperar 20-30 minutos

POST-EJECUCIÓN:
  [ ] Usuario 'patrimonial' existe
  [ ] Directorios creados correctamente
  [ ] Entorno virtual funciona
  [ ] .env generado
  [ ] Postfix funcionando
  [ ] Script de backup creado
  [ ] Script de monitoreo creado

¿TODO BIEN? → PASAR A FASE 1
```

---

## 🔍 SOLUCIONAR PROBLEMAS

### Error: "Permission denied" al ejecutar script

```bash
# Solución: Ejecutar con sudo
sudo bash SCRIPTS_FASE0_INSTALACION.sh
```

### Error: "apt-get: command not found"

```bash
# Significa que no es Ubuntu o Debian
# Solución: Ver Opción 2 - Manual (ajustar comandos para tu distro)
```

### Error: "python3.10: command not found" después del script

```bash
# Solución: Python 3.10 no se instaló correctamente
sudo apt-get install -y python3.10 python3.10-venv python3.10-dev
```

### Error: "Postfix configuration failed"

```bash
# Solución: Reconfigurarlo manualmente
sudo dpkg-reconfigure postfix
# Seleccionar: "Internet Site"
```

### Script se interrumpe por error

```bash
# Ver cuál fue el error
# Ejecutar el script nuevamente
# Si persiste, usar Opción 2 (manual)
```

---

## 📊 QUÉ PASA AHORA

**Después de FASE 0 completada:**

```
/opt/control_patrimonial/
├── venv/                          # Entorno virtual Python
├── data/                          # Base de datos
├── uploads/
│   ├── import/                   # Archivos importados
│   ├── documents/
│   ├── images/
│   └── temp/
├── scripts/
│   ├── backup.sh                 # Script de backup
│   └── monitor.sh                # Script de monitoreo
├── logs/                         # Logs de aplicación
├── .env                          # Variables de entorno (SEGURO)
├── requirements.txt              # Dependencias Python
├── config.py                     # Configuración Flask
└── ... (código de la aplicación)
```

---

## 🎯 PRÓXIMO PASO

Cuando FASE 0 esté completa:

1. **Copia tu código fuente a /opt/control_patrimonial**

```bash
# Si tienes en local:
scp -r /ruta/tu/codigo/* usuario@servidor:/opt/control_patrimonial/

# O si usas git:
cd /opt/control_patrimonial
git clone https://github.com/tu-usuario/control_patrimonial.git .
```

2. **Instala dependencias Python específicas**

```bash
cd /opt/control_patrimonial
source venv/bin/activate
pip install -r requirements.txt
```

3. **Procede a FASE 1: Performance Fixes**

Ver: `PLAN_IMPLEMENTACION_B_OPCION_3SEMANAS.md` → Sección FASE 1

---

## 📞 SI ALGO FALLA

1. **Leer el error completo**
2. **Buscar solución en esta sección "Solucionar problemas"**
3. **Si persiste, ejecutar manualmente los pasos (Opción 2)**
4. **Si aún falla, consultar documentación de Ubuntu**

---

## ⏱️ RESUMEN TIEMPO

```
Script automático:       20-30 minutos
Pasos manuales:          30-45 minutos
Verificaciones:          5 minutos

TOTAL FASE 0:            30-50 minutos
```

---

## 🎉 ¡FASE 0 COMPLETADA!

Una vez que hayas ejecutado el script o los pasos manuales y verificado todo:

```
✅ Servidor Ubuntu preparado
✅ Python, Git, Nginx, PostgreSQL instalados
✅ Usuario patrimonial creado
✅ Entorno virtual configurado
✅ Postfix listo para emails
✅ Directorios creados

SIGUIENTE: Copia tu código y pasa a FASE 1
```

**¿Listo para ejecutar el script? 🚀**

Ejecuta en tu servidor Ubuntu:
```bash
sudo bash SCRIPTS_FASE0_INSTALACION.sh
```

Luego, vuelve aquí y confirma que todo funcionó. ✅

