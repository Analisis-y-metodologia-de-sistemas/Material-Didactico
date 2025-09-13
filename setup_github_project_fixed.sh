#!/bin/bash

# Script para poblar el proyecto de GitHub con los work items de LISCOV
# Ejecutar: bash setup_github_project_fixed.sh

ORG="Analisis-y-metodologia-de-sistemas"
REPO="Material-Didactico"
PROJECT_NUMBER="2"

echo "🚀 Creando work items de LISCOV en GitHub Project..."
echo "Organización: $ORG"
echo "Repositorio: $REPO" 
echo "Proyecto: #$PROJECT_NUMBER"
echo ""

# Verificar que gh CLI está autenticado
if ! gh auth status > /dev/null 2>&1; then
    echo "❌ GitHub CLI no está autenticado. Ejecuta: gh auth login"
    exit 1
fi

# Función para crear issue
create_issue() {
    local title="$1"
    local body="$2"
    local labels="$3"
    local assignee="$4"
    
    echo "📝 Creando: $title"
    
    # Crear el issue
    if [ -n "$assignee" ]; then
        gh issue create \
            --repo "$ORG/$REPO" \
            --title "$title" \
            --body "$body" \
            --label "$labels" \
            --assignee "$assignee"
    else
        gh issue create \
            --repo "$ORG/$REPO" \
            --title "$title" \
            --body "$body" \
            --label "$labels"
    fi
    
    if [ $? -eq 0 ]; then
        echo "✅ Issue creado exitosamente"
        echo ""
    else
        echo "❌ Error creando issue: $title"
        echo ""
    fi
}

echo "🏗️ Creando work items..."
echo "=========================="

# TODO - Backlog items
create_issue \
    "LISCOV-243: Critical login bug" \
    "## Descripción
Corregir bug crítico en el sistema de login que impide a los usuarios acceder a la plataforma.

## Criterios de aceptación
- [ ] Identificar la causa raíz del problema de login
- [ ] Implementar la corrección
- [ ] Validar que todos los tipos de usuario pueden hacer login
- [ ] Agregar tests para prevenir regresiones

## Prioridad
🔴 **CRÍTICO** - Bloquea el acceso de usuarios

## Estimación
**Story Points:** 5
**Lead Time esperado:** 3-5 días" \
    "bug,critical,security" \
    ""

create_issue \
    "LISCOV-249: User progress API" \
    "## Descripción
Desarrollar API para obtener y actualizar el progreso de usuarios en cursos.

## Criterios de aceptación
- [ ] Endpoint GET /api/users/{id}/progress
- [ ] Endpoint PUT /api/users/{id}/progress
- [ ] Validación de permisos de usuario
- [ ] Documentación de API
- [ ] Tests unitarios y de integración

## Especificaciones técnicas
- **Framework:** Node.js/Express
- **Base de datos:** MongoDB
- **Autenticación:** JWT

## Estimación
**Story Points:** 8
**Lead Time esperado:** 5-7 días" \
    "enhancement,api,backend" \
    ""

create_issue \
    "LISCOV-252: Database optimization" \
    "## Descripción
Optimizar consultas de base de datos para mejorar el rendimiento del sistema.

## Criterios de aceptación
- [ ] Analizar queries lentas con profiler
- [ ] Crear índices necesarios
- [ ] Optimizar consultas N+1
- [ ] Implementar caché para queries frecuentes
- [ ] Validar mejora de performance (>30%)

## Métricas objetivo
- **Tiempo de respuesta:** <200ms
- **Throughput:** +50% consultas/seg
- **Uso de CPU:** -25%

## Estimación
**Story Points:** 13
**Lead Time esperado:** 7-10 días" \
    "performance,database,optimization" \
    ""

# IN PROGRESS items
create_issue \
    "LISCOV-247: UI/UX mejoras" \
    "## Descripción
Implementar mejoras de interfaz de usuario y experiencia de usuario basadas en feedback.

## Criterios de aceptación
- [ ] Redesign del dashboard principal
- [ ] Mejorar navegación y usabilidad
- [ ] Implementar design system consistente
- [ ] Tests de usabilidad con usuarios
- [ ] Responsive design para mobile

## Progreso actual
📅 **Día 3/5** - 60% completado
- ✅ Mockups aprobados
- ✅ Componentes base creados
- 🔄 Implementando dashboard
- ⏳ Pendiente: responsive design
- ⏳ Pendiente: testing

## Estimación
**Story Points:** 8
**Lead Time esperado:** 5 días" \
    "enhancement,ui,ux,frontend" \
    ""

create_issue \
    "LISCOV-248: API refactor" \
    "## Descripción
Refactorizar APIs legacy para mejorar mantenibilidad y performance.

## Criterios de aceptación
- [ ] Migrar de REST a GraphQL
- [ ] Implementar validación de esquemas
- [ ] Agregar rate limiting
- [ ] Documentación actualizada
- [ ] Migration path sin downtime

## Progreso actual
📅 **Día 2/7** - 28% completado
- ✅ Análisis de APIs existentes
- 🔄 Implementando GraphQL schemas
- ⏳ Pendiente: resolver implementation
- ⏳ Pendiente: migration scripts
- ⏳ Pendiente: testing y deployment

## Estimación
**Story Points:** 13
**Lead Time esperado:** 7 días" \
    "refactor,api,backend,graphql" \
    ""

# CODE REVIEW items
create_issue \
    "LISCOV-251: Responsive dashboard" \
    "## Descripción
Implementar diseño responsive para el dashboard principal que funcione en todos los dispositivos.

## Criterios de aceptación
- [ ] Layout responsive para mobile (320px+)
- [ ] Layout responsive para tablet (768px+)
- [ ] Layout responsive para desktop (1024px+)
- [ ] Touch-friendly en dispositivos móviles
- [ ] Performance optimizada para mobile

## Estado actual
🔍 **CODE REVIEW** - Esperando aprobación
- ✅ Implementación completa
- ✅ Tests pasando
- 🔄 En revisión de código
- ⏳ Pendiente: aprobación final

## Reviewers
- @carlos (lead developer)
- @ana (QA engineer)

## Estimación
**Story Points:** 5
**Lead Time esperado:** 3-4 días" \
    "enhancement,responsive,frontend,mobile" \
    ""

create_issue \
    "LISCOV-265: Code review process improvements" \
    "## Descripción
Mejorar el proceso de code review para reducir el tiempo en esta etapa.

## Problema identificado
🚨 **Lead Time:** 12 días (excede límite de 8 días)
**Bottleneck:** Reviews toman demasiado tiempo

## Criterios de aceptación
- [ ] Definir SLA para reviews (max 2 días)
- [ ] Implementar automated checks
- [ ] Training para reviewers
- [ ] Métricas de seguimiento
- [ ] Process documentation

## Acciones inmediatas
🔴 **URGENTE** - Requiere atención para desbloquear flujo

## Estimación
**Story Points:** 8
**Lead Time esperado:** 5 días" \
    "process,improvement,code-review" \
    ""

# TESTING items
create_issue \
    "LISCOV-245: Auth service fix" \
    "## Descripción
Corregir problemas en el servicio de autenticación que causan fallos intermitentes.

## Criterios de aceptación
- [ ] Identificar causa de fallos intermitentes
- [ ] Implementar fix para race conditions
- [ ] Agregar logging detallado
- [ ] Tests de carga para validar estabilidad
- [ ] Documentar solución

## Estado actual
🧪 **TESTING** - En proceso de validación
- ✅ Fix implementado
- ✅ Unit tests pasando
- 🔄 Integration tests ejecutándose
- ⏳ Pendiente: load testing
- ⏳ Pendiente: sign-off de QA

## Estimación
**Story Points:** 5
**Lead Time esperado:** 3-4 días" \
    "bug,auth,backend,testing" \
    ""

create_issue \
    "LISCOV-290: Testing improvements" \
    "## Descripción
Implementar mejoras en la suite de testing para aumentar confiabilidad.

## Criterios de aceptación
- [ ] Aumentar code coverage a >80%
- [ ] Implementar E2E tests críticos
- [ ] CI/CD pipeline optimizado
- [ ] Parallel test execution
- [ ] Flaky tests fixed

## Estado actual
🧪 **TESTING** - 1 día en testing

## Estimación
**Story Points:** 8
**Lead Time esperado:** 4-5 días" \
    "testing,ci-cd,quality" \
    ""

# DONE items
create_issue \
    "LISCOV-240: Sprint planning facilitation" \
    "## Descripción
Facilitar sesión de sprint planning para el próximo ciclo de desarrollo.

## Criterios de aceptación
- [x] Preparar agenda de planning
- [x] Facilitar sesión con todo el equipo
- [x] Definir sprint goal y scope
- [x] Story points estimados
- [x] Commitment del equipo registrado

## Resultado
✅ **COMPLETADO** - Sprint planning exitoso
- **Sprint Goal:** Mejorar performance y UX
- **Commitment:** 34 story points
- **Duration:** 2 semanas

## Estimación
**Story Points:** 2
**Lead Time real:** 1 día" \
    "planning,facilitation,completed" \
    ""

create_issue \
    "LISCOV-244: Deploy pipeline" \
    "## Descripción
Configurar pipeline de deployment automático para el ambiente de producción.

## Criterios de aceptación
- [x] GitHub Actions workflow configurado
- [x] Automated testing en CI
- [x] Deploy a staging automático
- [x] Manual approval para production
- [x] Rollback strategy implementada

## Resultado
✅ **COMPLETADO** - Pipeline funcionando
- **Deployment time:** 8 minutos
- **Success rate:** 100% (últimos 10 deploys)
- **Rollback time:** <2 minutos

## Estimación
**Story Points:** 8
**Lead Time real:** 3 días" \
    "devops,ci-cd,automation,completed" \
    ""

# Items adicionales del tablero Kanban
create_issue \
    "LISCOV-275: Performance monitoring" \
    "## Descripción
Implementar herramientas de monitoreo de performance en producción.

## Criterios de aceptación
- [x] Configurar APM (Application Performance Monitoring)
- [x] Dashboards de métricas clave
- [x] Alertas automáticas
- [x] Integration con Slack/Email

## Estado
✅ **COMPLETADO** - 2 días
**Lead Time:** 2 días" \
    "monitoring,performance,completed" \
    ""

create_issue \
    "LISCOV-280: User feedback integration" \
    "## Descripción
Integrar sistema de feedback de usuarios en la aplicación.

## Criterios de aceptación
- [ ] Widget de feedback en todas las páginas
- [ ] Dashboard para revisar feedback
- [ ] Categorización automática
- [ ] Integration con sistema de tickets

## Estado actual
⚠️ **8 días** - Requiere atención
Más tiempo del esperado debido a complejidad técnica

## Estimación
**Story Points:** 5
**Lead Time esperado:** 5 días" \
    "enhancement,feedback,frontend" \
    ""

create_issue \
    "LISCOV-287: Documentation updates" \
    "## Descripción
Actualizar documentación técnica y de usuario.

## Criterios de aceptación
- [x] API documentation actualizada
- [x] User guides revisados
- [x] Developer onboarding guide
- [x] Architecture diagrams actualizados

## Estado
✅ **COMPLETADO** - 3 días" \
    "documentation,completed" \
    ""

create_issue \
    "LISCOV-289: Performance optimization" \
    "## Descripción
Optimizar performance de la aplicación basado en métricas de producción.

## Problema identificado
🚨 **Lead Time:** 14.5 días (fuera de control)
**Causa especial:** Complejidad técnica subestimada

## Criterios de aceptación
- [ ] Database query optimization
- [ ] Frontend bundle size reduction
- [ ] CDN configuration
- [ ] Caching strategy implementation
- [ ] Performance testing validation

## Root Cause Analysis
- Complejidad técnica mayor a la estimada
- Dependencias externas no consideradas
- Falta de expertise en el equipo

## Estimación
**Story Points:** 21
**Lead Time esperado:** 10-12 días" \
    "performance,optimization,complex" \
    ""

create_issue \
    "LISCOV-301: Quick UI fixes" \
    "## Descripción
Pequeñas correcciones de UI reportadas por usuarios.

## Criterios de aceptación
- [x] Fix button alignment issues
- [x] Correct color scheme inconsistencies  
- [x] Mobile layout adjustments

## Estado
✅ **COMPLETADO** - 1 día" \
    "ui,quick-fix,completed" \
    ""

create_issue \
    "LISCOV-302: Minor bug fixes" \
    "## Descripción
Colección de bugs menores reportados en producción.

## Criterios de aceptación
- [x] Fix null pointer exceptions
- [x] Correct validation messages
- [x] Update error handling

## Estado
✅ **COMPLETADO** - 2 días" \
    "bug,minor,completed" \
    ""

echo ""
echo "🎉 ¡Script completado!"
echo "✅ Se crearon todos los work items de LISCOV"
echo ""
echo "🔗 Ver issues: https://github.com/$ORG/$REPO/issues"
echo ""
echo "📊 Próximos pasos:"
echo "1. Los issues se crearon, pero necesitas agregarlos manualmente al proyecto"
echo "2. Ve a: https://github.com/orgs/$ORG/projects/$PROJECT_NUMBER"
echo "3. Usa 'Add item from repository' para agregar cada issue al proyecto"
echo "4. Organiza los issues en las columnas correctas según su estado"