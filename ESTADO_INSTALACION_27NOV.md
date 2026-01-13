# Estado de Instalación - Control Patrimonial
**Fecha**: 27 de Noviembre de 2025
**Estado**: 70% COMPLETADO - Pendiente finalización mañana

---

## ✅ COMPLETADO

### Infraestructura del Servidor
- ✅ PostgreSQL 15 instalado y funcionando
- ✅ Usuario `control_patrimonial` creado en PostgreSQL
- ✅ Base de datos `control_patrimonial` creada
- ✅ Contraseña BD: `Control2025Patrimonial!`

### Código y Dependencias
- ✅ Código transferido a `/home/patrimonio/control_patrimonial`
- ✅ Python venv creado en `/home/patrimonio/control_patrimonial/venv`
- ✅ Dependencias Flask instaladas (flask, flask-sqlalchemy, flask-login, flask-wtf, flask-cors, bcrypt, psycopg2-binary)
- ✅ Gunicorn instalado

### Configuración
- ✅ DATABASE_URL configurada correctamente
- ✅ FLASK_ENV=production listo
- ✅ Bootstrap descargado localmente

---

## ⏳ PENDIENTE PARA MAÑANA

### 1. Iniciar Gunicorn (Puerto 8000)
En terminal SSH ejecutar:
```bash
ssh patrimonio@10.28.106.250
# Contraseña: T1C050p06769077

cd ~/control_patrimonial
source venv/bin/activate
export FLASK_ENV=production
export DATABASE_URL='postgresql://control_patrimonial:Control2025Patrimonial!@localhost:5432/control_patrimonial'
nohup gunicorn --workers 2 --bind 127.0.0.1:8000 --timeout 60 run:app > ~/gunicorn.log 2>&1 &
sleep 3
curl -s http://127.0.0.1:8000/ | head -10
```

### 2. Configurar Nginx
Una vez Gunicorn esté corriendo, ejecutar en otra terminal SSH:
```bash
sudo bash << 'EOF'
cat > /etc/nginx/sites-available/control_patrimonial << 'NGINX'
server {
    listen 80;
    server_name _;
    client_max_body_size 16M;
    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_redirect off;
    }
    location /static/ {
        alias /home/patrimonio/control_patrimonial/app/static/;
        expires 30d;
    }
}
NGINX

ln -sf /etc/nginx/sites-available/control_patrimonial /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
nginx -t && systemctl restart nginx
echo "[OK] Nginx configurado"
EOF
```

### 3. Verificar en Navegador
Abrir: `http://10.28.106.250`

Deberías ver la pantalla de login de Control Patrimonial

---

## 📝 INFORMACIÓN IMPORTANTE

### Credenciales del Servidor
- **IP**: 10.28.106.250
- **Usuario SSH**: patrimonio
- **Contraseña SSH**: T1C050p06769077
- **BD Host**: localhost
- **BD Usuario**: control_patrimonial
- **BD Password**: Control2025Patrimonial!
- **BD Nombre**: control_patrimonial

### Rutas en Servidor
- **Código**: `/home/patrimonio/control_patrimonial`
- **Venv**: `/home/patrimonio/control_patrimonial/venv`
- **Logs Gunicorn**: `/home/patrimonio/gunicorn.log`
- **Requirements**: `/home/patrimonio/control_patrimonial/requirements_prod.txt`

### Puertos
- **Gunicorn**: 127.0.0.1:8000
- **Nginx**: 0.0.0.0:80
- **PostgreSQL**: localhost:5432

---

## 🔍 DIAGNÓSTICO SI HAY PROBLEMAS

### Si Gunicorn no inicia
```bash
tail -50 ~/gunicorn.log
```

### Si Nginx no funciona
```bash
sudo nginx -t
sudo systemctl status nginx
sudo tail -20 /var/log/nginx/error.log
```

### Si PostgreSQL no responde
```bash
psql -h localhost -U control_patrimonial -d control_patrimonial -c "SELECT 1"
```

---

## 📋 RESUMEN DE TAREAS

| Tarea | Estado | Responsable |
|-------|--------|-------------|
| PostgreSQL instalado | ✅ HECHO | Claude |
| BD creada | ✅ HECHO | Claude |
| Código en servidor | ✅ HECHO | Claude |
| Dependencias Python | ✅ HECHO | Claude |
| Iniciar Gunicorn | ⏳ MAÑANA | Usuario |
| Configurar Nginx | ⏳ MAÑANA | Usuario |
| Verificar acceso | ⏳ MAÑANA | Usuario |
| HTTPS/SSL | ⏳ DESPUÉS | Usuario |
| Backups automáticos | ⏳ DESPUÉS | Usuario |

---

**Próxima sesión**: Ejecutar Gunicorn y configurar Nginx
