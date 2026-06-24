Feature: Sesiones de estudio y modo concentración
  Como estudiante universitario con distracciones digitales
  Quiero iniciar y configurar sesiones de estudio con control de aplicaciones
  Para concentrarme mejor y reducir interrupciones durante mis actividades académicas

  Scenario Outline: Inicio exitoso de una sesión de estudio
    Given que el estudiante se encuentra en la sección de sesiones de estudio
    When define el "<objetivo>"
    And establece la duración "<duracion>"
    And presiona el botón "Iniciar sesión"
    Then el sistema inicia la sesión de estudio
    And muestra el temporizador activo

    Examples:
      | objetivo                    | duracion |
      | Resolver ejercicios          | 45 min   |
      | Estudiar para una evaluación | 60 min   |

  Scenario: Finalización de sesión de estudio
    Given que el estudiante tiene una sesión de estudio activa
    When el tiempo configurado termina
    Then el sistema finaliza la sesión
    And muestra un resumen del tiempo estudiado

  Scenario Outline: Inicio de sesión con datos obligatorios incompletos
    Given que el estudiante intenta iniciar una sesión de estudio
    When deja el "<objetivo>" o la "<duracion>" sin completar
    Then el sistema no inicia la sesión
    And muestra el mensaje "Debe completar los datos requeridos"

    Examples:
      | objetivo             | duracion |
      |                      | 45 min   |
      | Repasar diapositivas |          |

  Scenario Outline: Configuración exitosa de duración de sesión
    Given que el estudiante se encuentra configurando una sesión de estudio
    When selecciona una duración válida de "<duracion>"
    And confirma la configuración
    Then el sistema guarda el tiempo seleccionado

    Examples:
      | duracion |
      | 25 min   |
      | 45 min   |
      | 60 min   |

  Scenario Outline: Aplicación de duración al temporizador
    Given que el estudiante configuró correctamente la duración de la sesión "<duracion>"
    When inicia la sesión de estudio
    Then el temporizador comienza con el tiempo seleccionado

    Examples:
      | duracion |
      | 25 min   |
      | 50 min   |

  Scenario Outline: Configuración con duración inválida
    Given que el estudiante está configurando una sesión de estudio
    When ingresa una duración inválida de "<duracion>"
    Then el sistema no guarda la duración
    And muestra el mensaje "Debe ingresar una duración válida"

    Examples:
      | duracion |
      | 0 min    |
      | -10 min  |

  Scenario Outline: Bloqueo exitoso de aplicaciones distractoras
    Given que el estudiante seleccionó la aplicación distractora "<aplicacion>"
    When inicia una sesión de estudio
    Then el sistema limita el acceso a la aplicación "<aplicacion>"

    Examples:
      | aplicacion |
      | TikTok     |
      | Instagram  |
      | WhatsApp   |

  Scenario Outline: Finalización del bloqueo de aplicaciones
    Given que las aplicaciones distractoras están bloqueadas durante una sesión de estudio
    When la sesión de estudio finaliza
    Then el sistema restablece el acceso a la aplicación "<aplicacion>"

    Examples:
      | aplicacion |
      | TikTok     |
      | Instagram  |

  Scenario Outline: Intento de acceso a una aplicación bloqueada
    Given que el estudiante tiene una sesión de estudio activa
    When intenta acceder a la aplicación bloqueada "<aplicacion>"
    Then el sistema muestra la alerta "Esta aplicación está restringida"

    Examples:
      | aplicacion |
      | TikTok     |
      | Instagram  |

  Scenario Outline: Registro de aplicación permitida
    Given que el estudiante se encuentra configurando el modo concentración
    When selecciona la aplicación "<aplicacion>" como permitida
    Then el sistema agrega la aplicación a la lista de excepciones

    Examples:
      | aplicacion       |
      | Google Classroom |
      | Google Drive     |
      | Calculadora      |

  Scenario Outline: Acceso a aplicación permitida durante una sesión
    Given que el estudiante tiene una sesión de estudio activa
    And la aplicación "<aplicacion>" está marcada como permitida
    When accede a dicha aplicación
    Then el sistema permite su uso sin mostrar restricciones

    Examples:
      | aplicacion       |
      | Google Classroom |
      | Google Drive     |

  Scenario Outline: Eliminación de aplicación permitida
    Given que existe una aplicación "<aplicacion>" en la lista de excepciones
    When el estudiante elimina la aplicación de la lista
    Then el sistema la considera bloqueada en la siguiente sesión

    Examples:
      | aplicacion       |
      | Google Classroom |
      | Google Drive     |
