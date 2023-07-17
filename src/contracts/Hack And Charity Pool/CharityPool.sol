
pragma solidity ^0.5.0;

contract CharityPool {    

    // uint8 start focusing, save gas costs.
    uint8 public WITHDRAW_AMOUNT = 5;



//     mapping(address => uint) public lastWithdrawalTime;

//     uint public withdrawalCooldown = 1 weeks; 

    /*
        CharityPool will automatically receive X ETH. Any user can 
        donate. But their amount goes into the cumulative total of the
        contract, and it's no longer associated with their address.
    */
    function contribute() public payable 
    {
        /* 
          Code below is only needed for readability.  As the ETH value
          is automatically deposited to the contract balance without it.
          
          However, if msg.value was, say 2 ETH (when 5 ETH was sent with 
          the transaction) then only 2 ETH gets deposited the contract's
          balance.  The other 3 ETH remain with the user. 
        */
        (bool success, ) = address(this).call.value(msg.value)("");
        require(success, "Failed to transfer funds");
    }



    function withdraw() public 
    {    
        require(WITHDRAW_AMOUNT <= address(this).balance, "Insufficient balance");
        

 //        require(!locked[msg.sender], "Withdrawal in progress");



        // call is a low-level built in Solidity function that transfer's 
        // ..ETH from contract account to msg.sender
        (bool success, ) = msg.sender.call.value(WITHDRAW_AMOUNT)("");
        require(success, "Failed to transfer funds");


 //        locked[msg.sender] = false; // Release the lock

        /// MAKE PART BELOW SEP FUNC. test withdrawal time
        //         require(block.timestamp >= lastWithdrawalTime[msg.sender] + withdrawalCooldown, "Cooldown period not over yet");
//         lastWithdrawalTime[msg.sender] = block.timestamp;

    }
}