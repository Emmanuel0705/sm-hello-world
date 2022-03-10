// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 *Hello Word Contract
 */
contract Hello_world{

    address public minter;    
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor () {
        minter = msg.sender;   
    }


    /**
     *mint function
     * 
     */
    function mint(address receiver, uint amount) public {
       require(msg.sender == minter, "Sorry! only minter can mint on this contract");
       require(amount < 1e60, "Amount must less than 1e60");
       balances[receiver] += amount;
    }

    /**
     * send function
     * 
     */
    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient Balance");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver,amount);
    }
}