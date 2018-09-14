var express = require('express');
var router = express.Router();


// create CRUD 
//https://www.youtube.com/watch?v=WYa47JkZH_U
//https://knexjs.org/
const knex = require('../db/knex');
//Login

//funcion que ejecuta el request para obtener el usuario ya logeado


router.get('/login/:id', (req, res)=>{

  const id = req.params.id;
    console.log(id)
  knex('Administrador')
      .where('id_administrador', id)
      .first()
      .then((user) => {
        if(user!=undefined) {
          console.log(user)
          //res.redirect(/usuarios);
          res.json({user:user})
          //res.render(login/sesion, {user:user})
        }else {
          //res.redirect("/login");
        }
      });

});

//funcion para redireccionar al formulario de logeo
router.get('/login', (req, res) => {
         
      res.render('user/login');
   
});


router.post('/auth', (req, res) => {  
 const usuario=req.body.usuario;
 const password=req.body.password;
   console.log("prueba",usuario); 
  knex('Administrador')
  .where({ usuario: usuario })
  .select('password')
  .select('id_administrador')  
  .then(function(result) {
    if (!result || !result[0])  {  // not found!
      console.log("Invalido user"); 
      return;
    }
    var pass = result[0].password;
    if (password === pass) {
        var user= result[0].id_administrador;
        console.log("usuario", user);
        
      res.render('user/prueba', {user: user});
    } else {
      console.log("authenticado"); 
    }
  })
  .catch(function(error) {
    console.log(error);
});
});



//logout
router.get('/cerrar', (req, res) => {  
    console.log("dsfn");
  res.render('user/logout');
});


//routing read database postgrsql
router.get('/', (req, res) => {
  knex('Avatar')
    .select()
    .then(avatar =>{
      res.render('avatar/index', { title: "Avatar", objAvatar: avatar });
  });  
});


 router.post('/puntajeguardar/:id', function(req, res){
     console.log("Entro al post");
    const id = req.params.id;

    knex('Avatar')
    .increment('puntaje', 1)
     .where('id_avatar', id)
     .then( avatar => {
      res.json({user: avatar});
    });
    
  });
router.post('/puntajeavatar/:id', (req, res) => {
  knex('Avatar')
    .select()
    .where('id_avatar',id)
      .first()
    .then(avatar =>{
      res.json({avatar: avatar});
  });  
});

//routing new + form+ get
router.get('/new', (req, res) => {
  res.render('avatar/new', { title: "Form Users" });
});
//muestra avatar creado
function respondAndRenderUser(id,res,viewName){  
  if(typeof id != 'undefined'){
    knex('Avatar')
      .select()
      .where('id_avatar',id)
      .first()
      .then(usuarios => {
        res.render(viewName,{avatar: usuarios});
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
router.get('/:id_avatar', (req, res) => {
  const id = req.params.id_avatar;
  respondAndRenderUser(id,res,'avatar/single');
  
});


router.get('/:id_avatar/edit', (req,res) => {
  const id = req.params.id_avatar;
  console.log('edit id:'+id);
  respondAndRenderUser(id,res,'avatar/edit');  
});


function validUser(user){
    console.log(user);
  return typeof user.url == 'string';
}

function validateUserInsertUpdateRedirect(req,res,callback){
  if(validUser(req.body)){
     //inser into db
    const usuarios = {
   foto : req.body.url        
    };    
    callback(usuarios);
    console.log("created");
  }else{
    //responde with an error    
    console.log('error on created');   
    res.status(500);
    res.render('error', {
      message: 'Invalid user at creatfdfsdfdsfsed' 
    });
  }
}

//routing new + form + post mostrar create avatar
router.post('/', (req, res) => {  
  validateUserInsertUpdateRedirect(req,res,(user) => { 
      console.log("entro");
    knex('Avatar')
      .returning('id_avatar')
      .insert({foto : req.body.url})
      .then(ids =>  {
        const id = ids[0];
        res.redirect(`/avatar/${id}`);
      });
  });
});

router.put('/:id_avatar',(req,res) => {
  console.log('updating...');
  validateUserInsertUpdateRedirect(req,res,(user) => {
      console.log(req.body.url);
    knex('Avatar')
      .where('id_avatar',req.params.id_avatar)
      .update({foto : req.body.url})
    
      .then( () =>  {
        res.redirect(`/avatar/${req.params.id_avatar}`);
      });
  });   
});

router.delete('/:id_avatar',(req,res)=>{
  const id=req.params.id_avatar;
  console.log('deleting...');
             
 if(typeof id != 'undefined'){
    knex('Avatar')      
      .where('id_avatar',id)
      .del()
      .then(usuarios => {
        console.log('delete id: '+id); 
        res.redirect('/avatar');      
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
router.post('/login/:usuario:password', (req, res) => {
    const usu=req.params.usuario;
     const pass=req.params.password;
    
  knex('Administrador')
    .select()
    .where('usuario, password',usuario, password)
    .then(usuarios =>{
      res.render('/user/login', { title: "Usuarios", objUsuarios: usuarios });
  });  
});

*/
module.exports = router;
