Feature: Registro y organización de tareas académicas
  Como estudiante universitario con alta carga académica
  Quiero registrar, organizar y ordenar mis tareas académicas
  Para planificar mejor mis actividades pendientes y saber qué debo realizar primero

  Scenario Outline: Registro exitoso de una tarea académica
    Given que el estudiante se encuentra en la sección de tareas académicas
    When ingresa el "<nombre_tarea>" y el "<curso>"
    And presiona el botón "Guardar"
    Then el sistema registra la tarea académica
    And muestra la tarea en el listado de actividades pendientes

    Examples:
      | nombre_tarea             | curso                    |
      | Informe de Requisitos    | Ingeniería de Requisitos |
      | Práctica de Matemática   | Matemática Discreta      |

  Scenario: Cancelación del registro de tarea académica
    Given que el estudiante ha ingresado información en el formulario de tareas
    When selecciona la opción "Cancelar"
    Then el sistema descarta la información ingresada
    And regresa al listado de tareas académicas

  Scenario Outline: Registro de tarea con campos obligatorios incompletos
    Given que el estudiante se encuentra en el formulario de registro de tareas
    When intenta guardar una tarea con "<nombre_tarea>" y "<curso>"
    Then el sistema no registra la tarea
    And muestra el mensaje "Debe completar la información requerida"

    Examples:
      | nombre_tarea          | curso                    |
      |                        | Ingeniería de Requisitos |
      | Informe de Requisitos |                          |

  Scenario Outline: Registro exitoso de fecha de entrega
    Given que el estudiante está registrando o editando una tarea académica
    When selecciona una fecha de entrega válida "<fecha_entrega>"
    And guarda la información
    Then el sistema registra la fecha de entrega asociada a la tarea

    Examples:
      | fecha_entrega |
      | 30/06/2026    |
      | 02/07/2026    |

  Scenario Outline: Modificación de fecha de entrega
    Given que una tarea tiene una fecha de entrega registrada
    When el estudiante modifica la fecha por "<nueva_fecha>"
    And guarda los cambios
    Then el sistema actualiza la fecha de entrega de la tarea

    Examples:
      | nueva_fecha |
      | 05/07/2026  |
      | 10/07/2026  |

  Scenario Outline: Registro de fecha de entrega inválida
    Given que el estudiante se encuentra registrando una fecha de entrega
    When selecciona una fecha anterior a la fecha actual "<fecha_entrega>"
    Then el sistema no guarda la fecha
    And muestra el mensaje "Debe seleccionar una fecha válida"

    Examples:
      | fecha_entrega |
      | 01/01/2026    |
      | 15/02/2026    |

  Scenario Outline: Ordenamiento de tareas por fecha más próxima
    Given que el estudiante tiene varias tareas con fechas de entrega registradas
    When accede al listado de tareas académicas
    Then el sistema muestra primero la tarea con fecha más cercana "<primera_tarea>"

    Examples:
      | primera_tarea          |
      | Estudiar para examen   |
      | Entregar informe final |

  Scenario: Ordenamiento de tareas sin fecha de entrega
    Given que existen tareas con fecha de entrega y tareas sin fecha registrada
    When el sistema muestra el listado ordenado
    Then coloca las tareas sin fecha después de las tareas que tienen fecha definida

  Scenario: Actualización automática del orden ante cambio de fecha
    Given que el estudiante modifica la fecha de entrega de una tarea
    When guarda los cambios realizados
    Then el sistema actualiza automáticamente la posición de la tarea en el listado

