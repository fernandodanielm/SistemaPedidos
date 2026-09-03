# Casos de uso del sistema de pedidos

## 1. Actores del sistema
- Usuario de mostrador: persona que atiende en el local y puede tomar, modificar, entregar y cobrar pedidos.
- Cocina: sector del negocio que recibe el pedido y actualiza su avance de preparación.
- Encargado: interviene en decisiones manuales excepcionales, especialmente cancelaciones fuera de la regla general.

> Nota: Cliente no se modela como actor directo porque en este MVP no interactúa directamente con el sistema; la operación se realiza desde el mostrador.

## 2. Casos de uso principales

### CU1 – Tomar Pedido
**Actor(es):** Usuario de mostrador

**Descripción breve:** El usuario registra un pedido con productos, cantidades y personalizaciones; el sistema calcula el total y lo envía automáticamente a cocina.

**Flujo principal de eventos:**
1. El usuario inicia un nuevo pedido en el sistema.
2. El sistema genera un número de pedido y solicita una referencia de retiro.
3. El usuario agrega productos o combos con sus cantidades y personalizaciones.
4. El sistema calcula el precio de cada ítem y el total del pedido.
5. El usuario confirma el pedido.
6. El sistema fija el estado como Recibido y envía la comanda a cocina.

**Precondiciones:**
- El local está operativo.
- El usuario está autenticado.

**Postcondiciones:**
- El pedido queda registrado con un número único, lista de ítems, total y estado Recibido.
- Cocina recibe la comanda sin intervención manual adicional.

---

### CU2 – Modificar Pedido
**Actor(es):** Usuario de mostrador

**Descripción breve:** El usuario corrige un pedido ya tomado, agregando, quitando o cambiando ítems o personalizaciones, siempre que cocina todavía no haya comenzado a prepararlo.

**Flujo principal de eventos:**
1. El usuario selecciona un pedido existente.
2. El sistema valida que el pedido esté en estado Recibido.
3. El usuario modifica ítems y/o personalizaciones.
4. El sistema recalcula el total del pedido.
5. Si ya existe un pago registrado, se registra la diferencia a cobrar.
6. El sistema conserva el mismo número de pedido.

**Precondiciones:**
- El pedido existe.
- El pedido está en estado Recibido.

**Postcondiciones:**
- El pedido queda actualizado con el total recalculado.
- El pedido en estado En preparación o posterior rechaza cualquier intento de modificación.

---

### CU3 – Cambiar Estado del Pedido
**Actor(es):** Cocina

**Descripción breve:** Cocina informa el avance del pedido y el sistema actualiza el estado respetando las transiciones válidas del ciclo de vida.

**Flujo principal de eventos:**
1. Cocina consulta la lista de pedidos pendientes.
2. Cocina indica que un pedido empezó a prepararse.
3. El sistema valida la transición Recibido → En preparación.
4. Cocina marca el pedido como terminado.
5. El sistema valida la transición En preparación → Listo.
6. El sistema bloquea modificaciones a partir de ese punto.

**Precondiciones:**
- El pedido existe.
- La transición solicitada es válida.

**Postcondiciones:**
- El pedido queda en un único estado consistente y visible para todo el negocio.

---

### CU4 – Cancelar Pedido
**Actor(es):** Usuario de mostrador, Encargado

**Descripción breve:** El pedido se cancela sin eliminar su registro histórico.

**Flujo principal de eventos:**
1. El usuario selecciona el pedido a cancelar.
2. El sistema verifica el estado actual.
3. Si el pedido está en Recibido o En preparación, la cancelación se autoriza directamente.
4. Si el pedido está en Listo, requiere la autorización del encargado.
5. El sistema cambia el estado a Cancelado.
6. El sistema conserva el registro para auditoría.

**Precondiciones:**
- El pedido no debe estar Entregado.

**Postcondiciones:**
- El pedido queda en estado Cancelado.
- El pedido no vuelve a estado activo ni de preparación.

---

### CU5 – Entregar Pedido
**Actor(es):** Usuario de mostrador

**Descripción breve:** El usuario identifica el pedido por número o nombre de retiro y lo entrega al cliente, marcando la operación como finalizada.

**Flujo principal de eventos:**
1. El cliente se presenta en el mostrador.
2. El usuario busca el pedido por número o referencia de retiro.
3. El sistema confirma que el pedido está Listo.
4. El usuario entrega el pedido físicamente.
5. El sistema marca el pedido como Entregado.

**Precondiciones:**
- El pedido existe.
- El estado actual es Listo.

**Postcondiciones:**
- El pedido queda en estado Entregado de forma definitiva.
- El pedido ya no admite modificación ni cancelación.

---

## 3. Otros casos de uso identificados
- Registrar Pago
- Enviar a Cocina (integrado en CU1)
- Consultar Pedidos Activos
- Marcar Prioridad

## 4. Reglas de negocio
1. Un pedido debe contener al menos un producto o combo.
2. Un pedido no puede modificarse si ya está en En preparación o posterior.
3. La comanda debe generarse automáticamente al confirmar el pedido.
4. Un pedido entregado no puede cancelarse ni modificarse.
5. Un pedido cancelado no puede revivir a un estado activo.
6. El pago no puede registrarse si el pedido ya fue cancelado o entregado.
7. La priorización manual debe afectar solo el orden de visualización.
8. Todo cambio relevante debe registrarse en auditoría.

## 5. Modelo de clases principal

### Clase Local
- idLocal
- nombre
- horarioAtencion
- pedidos: List<Pedido>

### Clase Usuario
- idUsuario
- nombre
- rol
- tomarPedido()
- modificarPedido()
- entregarPedido()
- cancelarPedido()

### Clase Cliente
- idCliente
- nombre
- telefono
- referenciaRetiro

### Clase Pedido
- idPedido
- fechaHora
- estado: EstadoPedido
- total
- referenciaRetiro
- items: List<ItemPedido>
- pago: Pago
- agregarItem()
- quitarItem()
- calcularTotal()
- confirmar()
- cancelar()
- cambiarEstado()
- entregar()

### Clase ItemPedido
- idItemPedido
- producto: Producto
- cantidad
- precioUnitario
- personalizaciones: List<Personalizacion>
- subtotal

### Clase Producto
- idProducto
- nombre
- descripcion
- categoria
- precioBase

### Clase Combo
- idCombo
- nombre
- productos: List<Producto>
- precioCombo
- aplicarDescuento()

### Clase Personalizacion
- idPersonalizacion
- descripcion
- costoAdicional

### Clase Comanda
- idComanda
- pedido: Pedido
- detalle
- fechaEnvio
- estado
- enviarACocina()
- actualizarEstado()

### Clase Pago
- idPago
- monto
- metodo
- fecha
- registrarPago()
- validarPago()

### Clase RegistroAuditoria
- idEvento
- entidad
- accion
- fechaHora
- usuario
- registrar()

### Enumeración EstadoPedido
- Recibido
- EnPreparacion
- Listo
- Entregado
- Cancelado

## 6. Estado del ciclo de vida del pedido
El flujo de estados del pedido es:
- Recibido → En preparación → Listo → Entregado
Y las excepciones son:
- Recibido → Cancelado
- En preparación → Cancelado
- Listo → Cancelado (requiere autorización del encargado)

## 7. Conclusión
El sistema de pedidos para Sabor Kiosco se basa en un modelo orientado a objetos claro, con estados definidos, reglas de negocio simples y separación de responsabilidades. Esto garantiza una operación ordenada, un manejo uniforme del pedido y una base sólida para avances futuros del sistema.
