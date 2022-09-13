<h1> Grupo 10 </h1>

<blockquote>

Laboratorio #01

</blockquote>

<ul>
    <li> De Ipola Guillermo ðŸ‹ </li>
    <li> Molina Franco ðŸ˜¶â€ðŸŒ«ï¸ </li>
    <li> Ebner Lautaro ðŸš™ </li>
    <li> LudueÃ±a Zakka Juan Pablo ðŸ–¨ï¸ </li>
</ul>

<details>
    <summary> CÃ³mo compilar su cÃ³digo</summary>
    <br>

Para compilar el codigo y crear un ejecutable con nombre mybash 

<blockquote>
$ make
</blockquote>

Para borrar los archivos objets y el ejecutable

<blockquote>
$ make clean
</blockquote>

Para correr el programa se puede ejecutar

<blockquote>
$ make run
</blockquote>

Ã³ podemos llamar al ejecutables directamente

<blockquote>
$ ./mybash
</blockquote>
    
</details>

<details>
    <summary> Debugger</summary>
    <br>

Para debuggear el sistema lo haremos con la erramienta valgrind a travez del comando

<blockquote>
$ make debugger
</blockquote>

Ã³ directamente corriendo ejecutando el valgrind

<blockquote>
$ make
$ valgrind ./mybash
</blockquote>

</details>

<details>
    <summary> Listar los comandos que ustedes probaron:</summary>
    <br>

<blockquote>
    <t> $ ls -l | grep -v </t>
    <t> $ ls -l | wc -l > prueba.txt </t>
    <t> $ errorerror </t>
    <t> $ exit </t>
</blockquote>

</details>

<details>
    <summary> Decisiones de implementaciÃ³n:</summary>
    <br>

</details>

<details>
    <summary> Items relevante:</summary>
    <br>

</details>

<details>
    <summary> Extra: nuestra forma de trabajar</summary>
    <br>


<li> Manejamos un sistema de  control de verciones: [Bitbucket](https://bitbucket.org/) </li>
<li> Nos manejamos a travez de ramas (branchs) propias de cada tarea por hacer (normalmente distribuidas por archivos) </li>
<li> ComunicaciÃ³n: [Discord](https://discord.com) y [ClickUp](https://app.clickup.com) </li>

</details>







<style>

    blockquote {
        border-left: 3px solid #01ff70 !important;
        padding-left: 1rem !important;
        background-color: #333 !important;

    }

    ul li::before {
        content: "\2022";
        color: #01ff70;
        font-weight: bold;
        display: inline-block; 
        width: 1em;
        margin-left: -1em;
    }

    h1{
        animation: mymove 3s infinite;
    }

    h2{
        color: #01ff70 !important;
    }

    h4{
        color: #01ff70 !important;
    }

    summary{
        animation: mymove 5s infinite;
        font-weight: bold;        
    }

    a{
        text-decoration: underline !important;
        color: #01ff70 !important;
    }
    
    *{
        font-family: "Courier New";
        background-color: #333;
        color: #fafafa !important;
    }

    @keyframes mymove {
        from {
            text-shadow: 0 0px 2px, 0 0 1em #01ff70, 0 0 0.2em #01ff70, 0 0 0.1em #01ff70;
            color: white;
        }
        50% {
            text-shadow: 0 0px 2px, 0 0 1em #333, 0 0 0.2em #333, 0 0 0.1em #333;
            color: white; 
        }
        to {
            text-shadow: 0 0px 2px, 0 0 1em #01ff70, 0 0 0.2em #01ff70, 0 0 0.1em #01ff70;
            color: white;
        }
    }
</style>