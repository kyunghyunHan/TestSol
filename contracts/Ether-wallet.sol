pragma solidity ^0.8.13;
//기본지갑 
//누구다 ETH를 보낼수 있습니다.
//소유자만 철회할수 있습니다
contract EtherWallet{

    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
    }
    receive() external payable{}

    function withdraw(uint _amount)external{

        require(msg.sender == owner,"발신자는 소유자가 아닙니다");
        payable(msg.sender).transfer(_amount);
    }
    function getBalance() external view returns (uint){
        return address(this).balance;
    }
}