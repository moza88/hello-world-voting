//Specify what version of compiler
pragma solidity ^0.4.11;

contract Voting {
    /* Mapping field below is equialent to an associative array or hash
    The key of the mapping is candidate name stored as type bytes32 and value is 
    an unsigned integer to store the vote count
    */
    mapping (bytes32 => uint8) public votesRecieved;
    
    /* Solidity doesn't let you pass in an array of strings in the constructor
    So we will use an array of bytes32 instead to store the list of candidates
    */
    bytes32[] public candidateList;
    
    /*Will be called when you deploy this contract
    We will pass an array of the cadidates
    */
    function Voting(bytes32[] candidateNames) {
        candidateList = candidateNames;
    }
    
    /*Function returns the total votes a cnadidate recieves */
    function totalVotesFor(bytes32 candidate) returns (uint8) {
        if (validCandidate(candidate) == false) revert();
        return votesRecieved[candidate];
    }
    
    /*Increment the vote count the specified candidate, casting a vote*/
    function voteForCandidate(bytes32 candidate) {
        if (validCandidate(candidate) == false) revert();
        votesRecieved[candidate] +=1;
    }
    
    function validCandidate(bytes32 candidate) returns (bool) {
        for(uint i = 0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
        }
        return false;
    }
}
