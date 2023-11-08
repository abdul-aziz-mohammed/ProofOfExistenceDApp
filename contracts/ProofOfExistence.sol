// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProofOfExistence {
    // State variable to store a document hash
    mapping(bytes32 => uint256) private docHashes;

    // Event to emit when a document is registered
    event DocumentRegistered(bytes32 indexed hash, uint256 timestamp);

    // Function to store the hash of a document
    function registerDocument(bytes32 _hash) public {
        require(docHashes[_hash] == 0, "Document already registered.");
        docHashes[_hash] = block.timestamp; // Store the current block's timestamp
        emit DocumentRegistered(_hash, block.timestamp);
    }

    // Function to retrieve the registration timestamp for a document hash
    function verifyDocument(bytes32 _hash) public view returns (uint256 timestamp) {
        require(docHashes[_hash] != 0, "Document not registered.");
        return docHashes[_hash];
    }
}
