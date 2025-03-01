// Función para agregar producto al inventario
function addProduct(productName) {
  document.getElementById('productMessage').textContent = `Producto '${productName}' agregado con éxito.`;
}

// Función para eliminar producto del inventario
function removeProduct(productName) {
  document.getElementById('productMessage').textContent = `Producto '${productName}' eliminado con éxito.`;
}

// Lógica de inicio de sesión
document.getElementById('loginFormElement').addEventListener('submit', function(event) {
  event.preventDefault(); 

  let username = document.getElementById('username').value;
  let password = document.getElementById('password').value;

  if (username === 'admin' && password === '1234') {
    document.getElementById('loginForm').style.display = 'none';
    document.getElementById('inventorySection').style.display = 'block';
    document.getElementById('sidebar').classList.add('show');
    document.getElementById('content').classList.add('sidebar-active');
  } else {
    document.getElementById('loginMessage').textContent = 'Credenciales incorrectas';
  }
});

// Función para alternar la visibilidad de la barra lateral
document.getElementById('toggleBtn').addEventListener('click', function() {
  let sidebar = document.getElementById('sidebar');
  let arrow = document.getElementById('arrow');
  sidebar.classList.toggle('show');
  document.getElementById('content').classList.toggle('sidebar-active');
  
  // Rotar la flecha al abrir/cerrar la barra lateral
  if (sidebar.classList.contains('show')) {
    arrow.textContent = '←'; // Mostrar flecha hacia la izquierda cuando la sidebar está abierta
  } else {
    arrow.textContent = '→'; // Mostrar flecha hacia la derecha cuando la sidebar está cerrada
  }
});
