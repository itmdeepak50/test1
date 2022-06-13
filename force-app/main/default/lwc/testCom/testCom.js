import { LightningElement } from 'lwc';

const people=[];

export default class TestCom extends LightningElement {

people =[ { name: 'adri'},
{ name: 'becky'},
{ name: 'chris'},
{ name: 'dillon'},
{ name: 'evan'},
{ name: 'frank'},
{ name: 'georgette'},
{ name: 'hugh'},
{ name: 'igor'},
{ name: 'jacoby'},
{ name: 'kristina'},
{ name: 'lemony'},
{ name: 'matilda'},
{ name: 'nile'},
{ name: 'ophelia'},
{ name: 'patrick'},
{ name: 'quincy'},
{ name: 'roslyn'},
{ name: 'solene'},
{ name: 'timothy'},
{ name: 'uff'},
{ name: 'violet'},
{ name: 'wyatt'},
{ name: 'x'},
{ name: 'yadri'},
{ name: 'zack'},

{ name: 'deepak'}
               ]

Serachkey;

array=[];
handleChangeName(event){

          this.Serachkey= event.target.value;
          var i=0;

         

          if(this.Serachkey!=''){
          this.people.forEach(element => {
              console.log('value are ', this.people[i].name);
            if(this.people[i].name.includes(this.Serachkey)){
                  this.array.push(this.people[i].name);
                  console.log('you are such',this.people[i].name)
                  console.log('hey you are close to your result')
            }   
            i++;

          });
        }
     
        console.log('value of array are ',this.array);
        this.array=[];
         /* if (Serachkey==people.name){
              console.log(person.name)
          }*/

}

}