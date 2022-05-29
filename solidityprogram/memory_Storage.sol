    pragma solidity >=0.7.5 <0.9;

    contract arrayContract {

    struct Company {
    string name;
    string revenue;
    }


    mapping(address=>Company) public companyInfo;

    function setBal() public {

        Company storage _Company = companyInfo[msg.sender];// 
        _Company.name = "Apple";
        // string: name Apple
        // string: revenue
        
        Company memory _company = companyInfo[msg.sender];// 
        _company.name = "Apple";
        // string: name 
        // string: revenue 

    
    



    } 
    
   


    


    }