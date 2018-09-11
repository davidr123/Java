var express = require('express');
var router = express.Router();


// create CRUD 
//https://www.youtube.com/watch?v=WYa47JkZH_U
//https://knexjs.org/
const knex = require('../db/knex');
//routing read database postgrsql
router.get('/', (req, res) => {
  knex('Imagenes')
    .select()
    .then(imagenes =>{
      res.render('images/index', { title: "Imagenes", objImagenes: imagenes });
  });  
});

//routing new + form+ get
router.get('/new', (req, res) => {
    console.log("jdf");
  res.render('images/new', { title: "Form Users" });
});

function respondAndRenderUser(id,res,viewName){  
  if(typeof id != 'undefined'){
      console.log("respon");
    knex('Imagenes')
      .select()
      .where('id_imagen',id)
      .first()
      .then(imagenes => {
        
        res.render(viewName,{imagenes: imagenes});
    });
  }else{
    
    console.log('error invalid id ');   
    res.status(500);
    res.render('error', {
      message: 'Invalid ID user' 
    });    
  }  
}

// router read show /user/id 
router.get('/:id_imagen', (req, res) => {
  const id = req.params.id_imagen;
    console.log("get"+ id);
  respondAndRenderUser(id,res,'images/single');
  
});


router.get('/:id_imagen/edit', (req,res) => {
  const id = req.params.id_imagen;
  console.log('edit id:'+id);
  respondAndRenderUser(id,res,'images/edit');  
});


function validUser(user){
  return typeof user.url == 'string';
}

function validateUserInsertUpdateRedirect(req,res,callback){
  if(validUser(req.body)){
     //inser into db
    const imagenes = {
      imagen : req.body.url,
      descripcion : "Prueba",
      id_partida : '1'      
    };    
    callback(imagenes);
    console.log("created");
  }else{
    //responde with an error    
    console.log('error on created');   
    res.status(500);
    res.render('error', {
      message: 'Invalid user at created' 
    });
  }
}

//routing new + form + post
router.post('/', (req, res) => {  
  validateUserInsertUpdateRedirect(req,res,(user) => { 
    console.log(req.body.url);
  knex('Imagenes')
     .returning('id_imagen')
      .insert({imagen : "prueba1",
       descripcion: req.body.url,
      id_partida : '1'  })
      .then(ids =>  {
        const id = ids[0];
       res.redirect(`/images/${id}`);
        
      });
  });
});

router.put('/:id_administrador',(req,res) => {
  console.log('updating...');
  validateUserInsertUpdateRedirect(req,res,(user) => {
    knex('Imagenes')
      .where('id_imagen',req.params.id_administrador)
      .update({imagen : req.body.imagen,
      descripcion : req.body.descripcion,
      id_partida : req.body.id_partida   })
      .then( () =>  {
        res.redirect(`/images/${req.params.id_administrador}`);
      });
  });   
});

router.delete('/:id_imagen',(req,res)=>{
  const id=req.params.id_imagen;
  console.log('deleting...');
             
 if(typeof id != 'undefined'){
    knex('Imagenes')      
      .where('id_imagen',id)
      .del()
      .then(usuarios => {
        console.log('delete id: '+id); 
        res.redirect('/images');      
    });
    
  }else{
    
    console.log('error invalid delete ');   
    res.status(500);
    res.render('error', {
      message: 'Invalid ID delete ' 
    });    
  }      
});














/*

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
        res.redirect(`/images/new/${id}`);
      });
    
});


router.get('/new:id_imagen', (req, res) => {
    console.log("get single");
  const id = req.params.id_imagen;
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
};*/
module.exports = router;
