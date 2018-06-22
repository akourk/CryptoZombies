// this program uses an inputted name to generate pseudo-random dna/features of a zombie
// the purpose is to learn Solidity
//	naming conventions, syntax, etc.
// this is the bare version, stripped of notes.
// easier to read

pragma solidity ^0.4.19

contract ZombieFactory {

	event NewZombie(uint zombieId, string name, uint dna);

	uint dnaDigits = 16; 
	uint dnaModulus = 10 ** dnaDigits;

	struct Zombie {
		uint dna;
		string name;
	}

	Zombie[] public zombies;
	
	function _createZombies(string _name, uint _dna) private {
		uint id = zombies.push(Zombie(_name, _dna)) - 1;
		NewZombie(id, _name, _dna);
	}

	function _generateRandomDna(string _str) private view returns (uint) {
		uint rand = uint(keccak256(_str));    
		return rand % dnaModulus;
	}

	function createRandomZombie(string _name) public {
		uint randDna = _generateRandomDna(_name);
		_createZombie(_name, randDna);
	}
}



























