//definicion de rutas en el servidor ademas de añadir el puerto
const express = require('express');
const cors = require('cors');
const connection = require('./Database');

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

// Ruta para obtener el usuario requerido 
app.get('/usuarios', (req, res) => {
    connection.query('SELECT * FROM Sucursal', (err, results) => {
        if (err) {
            console.error('Error en la consulta a la base de datos:', err.message);
            res.status(500).send('Error en la base de datos');
            return;
        }
        //en caso de que no existan datos en la tabla sucursal
        if (results.length === 0) {
            res.status(404).send('No se encontraron sucursales');
            return;
        }
        res.json(results);
    });
});

// llamado a la base de datos 
app.get('/bancodb', (req, res) => {
    res.json({ nombre: connection.config.database });
});

//llamarr a los clientes 
app.get('/clientes', (req, res) => {
    connection.query('SELECT * FROM Cliente', (err, results) => {
        if (err) {
            console.error('Error en la consulta a la base de datos:', err.message);
            res.status(500).send('Error en la base de datos');
            return;
        }
        if (results.length === 0) {
            res.status(404).send('No se encontraron clientes');
            return;
        }
        res.json(results);
    });
});
//puerto en el que se esta escuchando el servidor
app.listen(port, () => {
    console.log(`Servidor escuchando en el puerto ${port}`);
});

 