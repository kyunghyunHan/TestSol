//new계약은 키워드 를 사용하여 다른 계약에 의해 생성될 수 있습니다 . 0.8.0부터 new키워드는 옵션 create2을 지정하여 기능을 지원합니다 salt.

pragma solidity ^0.8.13;

contract Car {
   address public owner;
   string public model;
    address public carAddr;
      constructor(address _owner, string memory _model) payable {
        owner = _owner;
        model = _model;
        carAddr = address(this);
    }
}

contract CarFactory{

    Car[]public cars;
    function create(address _owner,string memory _model)public{
        Car car = new Car(_owner,_model);
        cars.push(car);


    }

    function createAndSendEther(address _owner,string memory _model)public payable{

        Car car  =(new Car){value:msg.value}(_owner,_model);
        cars.push(car);
    }
    function create2(
        address _owner,
        string memory _model,
        bytes32 _salt
    )public{
        Car car = (new Car){salt:_salt}(_owner,_model);
        cars.push(car);
    }
    function create2AndSendEther(
        address _owner,
        string memory _model,
        bytes32 _salt
    )public payable{
        Car car= (new Car){value: msg.value,salt:_salt}(_owner,_model);
        cars.push(car);
    }
    function getGar(uint _index)
    public
    view
    returns(
        address owner,
        string memory model,
        address carAddr,
        uint balance
    ){
        Car car = cars[_index];
        return (car.owner(),car.model(),car.carAddr(),address(car).balance);
    }
}