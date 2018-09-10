var express = require('express');
var router = express.Router();


// create CRUD 
//https://www.youtube.com/watch?v=WYa47JkZH_U
//https://knexjs.org/
const knex = require('../db/knex');
router.get('/', (req, res) => {
         console.log("get");
res.render('imagen/upload',{ title: 'ejemplo de subida de imagen por HispaBigData' });
});

router.post('/new', (req, res) => {  
    console.log(req.body.url);
  knex('Imagenes')
     .returning('id_imagen')
      .insert({imagen : "prueba1",
       descripcion: req.body.url,
      id_partida : '1'  })
      .then(ids =>  {
        const id = ids[0];
        res.redirect(`/imagen/${id}`);
      });
    
});


router.get('/:id_administrador', (req, res) => {
  const id = req.params.id_administrador;
  respondAndRenderUser(id,res,'imagen/single');
  
});
// Importamos el modulo para subir ficheros


exports.Uploads = function(req, res) {
    console.log(req.files);
    var tmp_path = req.files.photo.path;
    // Ruta donde colocaremos las imagenes
    var target_path = './public/images/' + req.files.photo.name;
   // Comprobamos que el fichero es de tipo imagen
    if (req.files.photo.type.indexOf('image')==-1){
                res.send('El fichero que deseas subir no es una imagen');
    } else {
         // Movemos el fichero temporal tmp_path al directorio que hemos elegido en target_path
        fs.rename(tmp_path, target_path, function(err) {
            if (err) throw err;
            // Eliminamos el fichero temporal
            fs.unlink(tmp_path, function() {
                if (err) throw err;
                res.render('imagen/upload',{message: '/images/' + req.files.photo.name,title: 'ejemplo de subida de imagen por HispaBigData'});
            });
         });
     }
};
module.exports = router;
