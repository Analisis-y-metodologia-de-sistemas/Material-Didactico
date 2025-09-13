# 🚀 Configuración del Proyecto LISCOV en GitHub

Este directorio contiene scripts para poblar el proyecto de GitHub con todos los work items del caso de estudio de LISCOV.

## 📋 Archivos incluidos

- `setup_github_project.sh` - Crea todos los issues con datos completos
- `configure_project_columns.sh` - Configura las columnas y estados del proyecto
- `README_project_setup.md` - Esta documentación

## 🛠️ Prerrequisitos

1. **GitHub CLI instalado**
   ```bash
   # En macOS
   brew install gh
   
   # En Ubuntu/Debian
   sudo apt install gh
   ```

2. **Autenticación configurada**
   ```bash
   gh auth login
   # Selecciona GitHub.com
   # Selecciona HTTPS como protocolo preferido
   # Autentícate con tu token o browser
   ```

3. **Permisos necesarios**
   - Acceso a la organización `Analisis-y-metodologia-de-sistemas`
   - Permisos para crear issues
   - Permisos para modificar proyectos

## 🚀 Ejecución

### Paso 1: Crear todos los work items
```bash
chmod +x setup_github_project.sh
./setup_github_project.sh
```

### Paso 2: Configurar columnas del proyecto
```bash
chmod +x configure_project_columns.sh
./configure_project_columns.sh
```

## 📊 Work Items que se crearán

### 📋 TODO (3 items)
- **LISCOV-243**: Critical login bug (🔴 Crítico)
- **LISCOV-249**: User progress API (🟡 Enhancement)
- **LISCOV-252**: Database optimization (🟡 Performance)

### 🔄 IN PROGRESS (4 items)
- **LISCOV-247**: UI/UX mejoras (Día 3/5) - Asignado: maria
- **LISCOV-248**: API refactor (Día 2/7) - Asignado: luis
- **LISCOV-280**: User feedback integration (8 días ⚠️)
- **LISCOV-289**: Performance optimization (14.5 días 🚨)

### 👀 CODE REVIEW (2 items)
- **LISCOV-251**: Responsive dashboard - Asignado: maria
- **LISCOV-265**: Code review improvements (12 días 🚨)

### 🧪 TESTING (2 items)
- **LISCOV-245**: Auth service fix - Asignado: luis
- **LISCOV-290**: Testing improvements - Asignado: ana

### ✅ DONE (6 items)
- **LISCOV-240**: Sprint planning facilitation - Asignado: ana
- **LISCOV-244**: Deploy pipeline - Asignado: carlos
- **LISCOV-275**: Performance monitoring - Asignado: carlos
- **LISCOV-287**: Documentation updates
- **LISCOV-301**: Quick UI fixes
- **LISCOV-302**: Minor bug fixes

## 👥 Asignaciones de equipo

- **maría** (Frontend Developer): LISCOV-247, LISCOV-251, LISCOV-280
- **luis** (Backend Developer): LISCOV-248, LISCOV-245
- **ana** (QA Engineer): LISCOV-290, LISCOV-240
- **carlos** (DevOps Engineer): LISCOV-244, LISCOV-275

## 🏷️ Labels utilizados

- `bug` - Para errores y problemas
- `enhancement` - Para mejoras y nuevas funcionalidades
- `critical` - Para issues de alta prioridad
- `performance` - Para optimizaciones de rendimiento
- `ui/ux` - Para mejoras de interfaz
- `api` - Para trabajo en APIs
- `testing` - Para mejoras en testing
- `documentation` - Para actualizaciones de documentación
- `completed` - Para items ya finalizados

## 📈 Métricas incluidas

Cada issue incluye métricas realistas de Kanban:
- **Story Points** estimados
- **Lead Time** esperado y real
- **Cycle Time** cuando aplica
- **Aging** para items que llevan mucho tiempo
- **Throughput** del equipo

## 🔧 Configuraciones post-setup

Después de ejecutar los scripts, configura en la UI de GitHub:

1. **WIP Limits por columna**:
   - IN PROGRESS: 3-4 items máximo
   - CODE REVIEW: 2 items máximo
   - TESTING: 2 items máximo

2. **Automations**:
   - Auto-mover issues cerrados a DONE
   - Notificar cuando items excedan SLA
   - Auto-asignar reviewers

3. **Views del proyecto**:
   - Board view (Kanban)
   - Table view (métricas)
   - Timeline view (roadmap)

## 🎯 Resultado final

El proyecto tendrá todos los work items del caso de estudio de LISCOV, permitiendo:

- Demostrar flujo de trabajo Kanban real
- Mostrar métricas y analytics
- Practicar gestión de WIP limits
- Analizar Lead Time y Cycle Time
- Identificar bottlenecks
- Hacer retrospectivas basadas en datos

## 🔗 Enlaces útiles

- [Proyecto en GitHub](https://github.com/orgs/Analisis-y-metodologia-de-sistemas/projects/2)
- [GitHub CLI Documentation](https://cli.github.com/manual/)
- [GitHub Projects Documentation](https://docs.github.com/en/issues/planning-and-tracking-with-projects)

## ⚠️ Troubleshooting

### Error de autenticación
```bash
# Verificar autenticación
gh auth status

# Re-autenticar si es necesario
gh auth login --web
```

### Error de permisos
```bash
# Verificar permisos en la organización
gh api user/memberships/orgs/Analisis-y-metodologia-de-sistemas
```

### Issues no aparecen en el proyecto
```bash
# Verificar que el proyecto existe
gh project list --owner Analisis-y-metodologia-de-sistemas

# Verificar items del proyecto
gh project item-list 2 --owner Analisis-y-metodologia-de-sistemas
```