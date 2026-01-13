# Tests del Control Patrimonial Web

Suite de tests automatizados para el proyecto Control Patrimonial usando **pytest**.

## Resumen Ejecutivo

✅ **65 tests creados y pasando**
- Fase 1: Tests de Autenticación (10 tests)
- Fase 2: Tests de API/Rutas (27 tests)
- Fase 3: Tests de Importación/Exportación (28 tests)

📊 **Cobertura de Código: 29%**
- Alto: `app/models_sqlalchemy.py` (81%)
- Medio: `app/__init__.py` (66%), `app/auth/routes.py` (43%)
- Bajo: `app/models.py` (0%), `app/main/routes.py` (24%)

## Estructura de Tests

```
tests/
├── conftest.py              # Configuración global y fixtures
├── test_auth.py             # Tests de autenticación y seguridad
├── test_api.py              # Tests de API REST
└── test_import_export.py    # Tests de importación/exportación
```

## Instalación de Dependencias

```bash
# Instalar dependencias de desarrollo
pip install -r requirements.dev.txt
```

Requisitos:
- `pytest==9.0.1`
- `pytest-cov==6.0.0`
- `coverage==7.12.0`

## Ejecutar Tests

### Ejecutar todos los tests
```bash
pytest tests/ -v
```

### Ejecutar tests específicos
```bash
# Tests de autenticación
pytest tests/test_auth.py -v

# Tests de API
pytest tests/test_api.py -v

# Tests de importación/exportación
pytest tests/test_import_export.py -v
```

### Ejecutar un test específico
```bash
pytest tests/test_auth.py::TestAuthenticationRoutes::test_login_page_get -v
```

### Ejecutar con cobertura
```bash
pytest tests/ --cov=app --cov-report=html
```

Esto genera un reporte en `htmlcov/index.html`

### Ejecutar con output detallado
```bash
pytest tests/ -v --tb=long
```

### Ejecutar tests rápidamente
```bash
pytest tests/ -q
```

## Categorías de Tests

### Fase 1: Autenticación (`test_auth.py`)

**TestAuthenticationRoutes**
- Validar acceso a página de login
- Manejo de credenciales vacías
- Cambio de contraseña
- Logout

**TestUserModels**
- Creación de usuarios admin
- Creación de usuarios operadores
- Hash de contraseñas
- Validación de duplicados

**TestAuthSecurity**
- Protección CSRF
- Headers de seguridad
- Inyección XSS
- SQL injection

### Fase 2: API REST (`test_api.py`)

**TestAPIBienes**
- GET /api/bienes (listar con paginación)
- GET /api/bienes/<id> (obtener detalles)
- POST /api/bienes (crear bien)
- Autenticación requerida

**TestAPIValidation**
- Formato de respuesta JSON
- Validación de campos requeridos
- Límites de paginación
- Manejo de errores

**TestAPIFiltering**
- Filtrado por búsqueda (q)
- Filtrado por sede
- Filtrado por dependencia
- Filtrado por estado
- Múltiples filtros simultáneos

**TestAPIEdgeCases**
- Caracteres especiales (ñ, acentos, etc.)
- Caracteres Unicode
- Queries muy grandes
- Valores null

**TestAPICORSHeaders**
- Validación de headers CORS
- Content-Type correcto

### Fase 3: Importación/Exportación (`test_import_export.py`)

**TestImportService**
- Inicialización del servicio
- Manejo de archivos vacíos
- Validación de formato Excel
- Validación de columnas requeridas
- Detección de duplicados
- Validación de tipos de datos
- Validación de campos requeridos

**TestExportService**
- Exportación a Excel
- Exportación a CSV
- Exportación a PDF
- Manejo de caracteres especiales
- Manejo de datasets grandes

**TestDataValidation**
- Validación de nombres requeridos
- Validación de descripción
- Validación de campos numéricos
- Validación de fechas
- Validación de enumeraciones

**TestImportExportIntegration**
- Round-trip (importar → exportar)
- Preservación de codificación UTF-8

## Fixtures Disponibles

Definidas en `conftest.py`:

```python
@pytest.fixture
def app:
    """Aplicación Flask con BD de testing"""

@pytest.fixture
def client:
    """Cliente HTTP para hacer requests de testing"""

@pytest.fixture
def db_session:
    """Sesión de base de datos para tests"""

@pytest.fixture
def user_admin:
    """Usuario administrador para testing"""

@pytest.fixture
def user_app:
    """Usuario operador para testing"""

@pytest.fixture
def login_admin:
    """Cliente con sesión de admin"""

@pytest.fixture
def login_user_app:
    """Cliente con sesión de usuario operador"""
```

## Ejemplo de Uso en Tests Propios

```python
def test_mi_feature(client, user_admin, db_session):
    """Test de mi nueva feature"""
    # client: cliente HTTP de testing
    # user_admin: usuario administrativo para BD
    # db_session: acceso a la BD de testing

    response = client.get('/ruta/probada')
    assert response.status_code == 200
```

## Configuración

Archivo `pytest.ini`:

```ini
[pytest]
testpaths = tests
python_files = test_*.py
python_classes = Test*
python_functions = test_*
addopts = -v --tb=short
```

## Markers Disponibles

```bash
pytest tests/ -m unit           # Tests unitarios
pytest tests/ -m integration    # Tests de integración
pytest tests/ -m auth           # Tests de autenticación
pytest tests/ -m api            # Tests de API
pytest tests/ -m import_export  # Tests de importación/exportación
pytest tests/ -m security       # Tests de seguridad
pytest tests/ -m slow           # Tests lentos
```

## Reporte de Cobertura

Después de ejecutar tests con cobertura:

```bash
# Ver cobertura en navegador
start htmlcov/index.html  # Windows
open htmlcov/index.html   # macOS
xdg-open htmlcov/index.html  # Linux
```

## Mejoras Futuras

### Próximas fases de testing:

1. **Fase 4: Tests de Integración**
   - Flujos completos end-to-end
   - Interacción entre módulos
   - Tests de BD
   - Tests de caché

2. **Fase 5: Tests de Rendimiento**
   - Carga de BD
   - Tiempo de respuesta de API
   - Importación de archivos grandes
   - Concurrencia

3. **Fase 6: Tests de UI**
   - Selenium para testing en navegador
   - Testing de JavaScript
   - Testing de responsive design

## Troubleshooting

### Error: "SQLALCHEMY_DATABASE_URI not set"
Verificar que TestingConfig esté configurado correctamente en `config.py`.

### Error: "No module named 'app'"
Ejecutar desde la carpeta raíz del proyecto:
```bash
cd E:\PROYECTOS WEB\control_patrimonial_web
pytest tests/
```

### Tests lentos
Usar `-x` para parar en primer error:
```bash
pytest tests/ -x
```

## Integración Continua

### GitHub Actions / CI/CD

Crear `.github/workflows/tests.yml`:

```yaml
name: Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@v2
        with:
          python-version: 3.11
      - run: pip install -r requirements.dev.txt
      - run: pytest tests/ --cov=app --cov-report=xml
      - uses: codecov/codecov-action@v2
```

## Contacto y Preguntas

Para más información sobre pytest:
- Documentación: https://docs.pytest.org
- Fixtures: https://docs.pytest.org/en/stable/fixture.html
- Coverage: https://coverage.readthedocs.io

---

**Última actualización:** 4 Diciembre 2025
**Total de tests:** 65
**Tasa de aprobación:** 100%
