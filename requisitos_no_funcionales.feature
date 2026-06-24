Feature: Requisitos no funcionales de FocusMate
  Como estudiante universitario
  Quiero que FocusMate sea seguro, fácil de usar, rápido y compatible con dispositivos móviles
  Para utilizar la aplicación con confianza y sin dificultades durante mis sesiones de estudio

  Scenario Outline: Protección de datos personales y académicos
    Given que existe información personal y académica registrada
    When un usuario no autenticado intenta acceder al recurso "<recurso>"
    Then el sistema deniega el acceso
    And muestra el mensaje "Acceso no autorizado"

    Examples:
      | recurso             |
      | tareas académicas   |
      | métricas personales |
      | sesiones de estudio |

  Scenario Outline: Acceso permitido con autenticación válida
    Given que el estudiante inició sesión correctamente
    When accede al recurso "<recurso>"
    Then el sistema muestra únicamente la información correspondiente a su cuenta

    Examples:
      | recurso             |
      | tareas académicas   |
      | métricas personales |

  Scenario Outline: Acceso a funciones principales en máximo tres niveles
    Given que el estudiante ha iniciado sesión en FocusMate
    When desea acceder a la función "<funcion>"
    Then puede llegar a la función en un máximo de "<niveles>" niveles de navegación

    Examples:
      | funcion             | niveles |
      | Tareas académicas   | 3       |
      | Sesiones de estudio | 3       |
      | Métricas            | 3       |

  Scenario Outline: Visualización clara de opciones principales
    Given que el estudiante se encuentra en la pantalla principal
    When revisa las opciones disponibles
    Then el sistema muestra nombres e íconos comprensibles para la opción "<opcion>"

    Examples:
      | opcion             |
      | Tareas académicas  |
      | Modo concentración |
      | Métricas           |

  Scenario Outline: Respuesta rápida del sistema
    Given que el estudiante está usando la función "<funcion>"
    When realiza la acción "<accion>"
    Then el sistema responde en menos de "<tiempo_maximo>" segundos

    Examples:
      | funcion      | accion         | tiempo_maximo |
      | Temporizador | iniciar sesión | 3             |
      | Tareas       | guardar tarea  | 3             |
      | Métricas     | cargar resumen | 3             |

  Scenario Outline: Temporizador activo sin interrupciones
    Given que el estudiante inició una sesión de estudio
    When el temporizador permanece activo durante "<duracion>"
    Then el sistema mantiene el conteo sin detenerse inesperadamente

    Examples:
      | duracion |
      | 25 min   |
      | 45 min   |

  Scenario Outline: Compatibilidad con dispositivos móviles
    Given que el estudiante instala FocusMate en el sistema operativo "<sistema>"
    When abre la aplicación
    Then el sistema muestra correctamente la pantalla principal
    And permite iniciar sesión sin errores visuales

    Examples:
      | sistema |
      | Android |
      | iOS     |

  Scenario Outline: Visualización correcta de funciones principales en móvil
    Given que el estudiante accede a FocusMate desde el sistema operativo "<sistema>"
    When ingresa a la función "<funcion>"
    Then la interfaz se adapta correctamente a la pantalla del dispositivo

    Examples:
      | sistema | funcion             |
      | Android | Tareas académicas   |
      | Android | Modo concentración  |
      | iOS     | Métricas            |
      | iOS     | Sesiones de estudio |