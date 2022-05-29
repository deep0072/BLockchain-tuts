pragma solidity >=0.7.5 < 0.9.6;

// create struct
// then create struct tupe list

// create function 
// update function
// get function

contract todoList{
    struct  todos {
        string text;
        bool status;
    }

    todos [] public todoList;


    function create(string memory _text) external {
        
        todoList.push(todos({
            text: _text,
            status: true
        }));
    }

    function update (uint index, string memory _text) public {
        // if want to update  single text use this method

        todoList[index].text = _text;

        // if want to update  mutiple text or anyother elemnt use this method

        // initialise struct type new varibale with storage keyword so that state variable can update
        // in this index calling will not be repeated

        todos storage nwTodo = todoList[index];
        nwTodo.text = _text;





    }

    function get(uint index) public view returns (string memory x, bool y ){
        // like if i want to get multiple output of struct then we use memory keyword


        todos storage nwtodo = todoList[index];
        x = nwtodo.text; 
        y = nwtodo.status;


    }
}