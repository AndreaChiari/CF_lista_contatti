const filterform = document.getElementById("filterform");

 function postForm(){

    filterform.submit()
}

const linktoxls = document.getElementById("linktoxls");

function downloadExcel(){
   linktoxls.click()
}

   $("selectProvince").select2({
      ajax: {
      url: "http://andrea.womtest.it/CF_lista_contatti/mod/API/APIprovince.cfm",
      dataType: 'json',
      }
 });

/* const containerValidazione = document.getElementById("container-validazione");
const successmail = document.getElementById("successmail");
const successname = document.getElementById("successname");


   
   successname.addEventListener("click",function(){
      containerValidazione.classList.add("d-none");
      successmail.classList.add("d-block");
   });
 */





/* const redirect = document.getElementById("redirect");

function redirectHome(){
    redirect.click()
 }
 */
