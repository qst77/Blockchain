// SPDX-License-Identifier: MIT
/* 
  Функционал:
  1. внести пожертвование (msg.value)
  2. вывести пожертвование на определенный адрес, только для создателя контракта
  3. хранить адреса всех пользователей, сделавших пожертовавание
  4. хранить суммы пожертвоаваний каждого пользователя
*/

pragma solidity ^0.7.0;

import "hardhat/console.sol";

contract Funding {
  address public owner;
  uint public raised = 0;
  mapping (address => uint) donations;
 
 
  modifier onlyOwner() { 
    require (owner == msg.sender);
    _;
  }

  constructor() {
  owner = msg.sender;
 }



//функция для приема пожертвований
function donate() public payable{
  raised += msg.value;
  donations[msg.sender] += msg.value;

}
//функция для отправки средств участнику
function send(address payable _to) public onlyOwner payable{
  bool sent = _to.send(msg.value);
  require(sent, "Failed to sent");
}

}