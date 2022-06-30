# Multi Sig Wallet
<br>
<br>
<br>


## A wallet that has multiple owner.store each token in single wallet
## to spend from this wallet owner need to get the approval from other owner.
<br>
<br>

## Basic Structure of this Multi sig Wallet<br>
<br>
<br>

## it has three 4 main function  and one is constructor
<li>
<ul>
    <b> constructor = this intialise the state variable the list of owner and the no of requireaprroval that is require for wallet transaction</b>
  
  
</ul>
<ul>
  
  <b> submitTransaction = by this function owner can submit the transaction prpopsal (that is owner want to send some token from wallet to the  recipeient)  to the wallet. this function result to transaciton id.</b> 

</ul>

<ul>    <b> approve = this function approve from the one of the owner if multi sig waller the transaction that is submitted  by the submitTransaction function. its output set the approved to true </b>
</ul>


<ul>   <b> execute = this function execute the approved proposal </b>
</li>




