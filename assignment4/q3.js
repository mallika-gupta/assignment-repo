const crypto = require('crypto');

function findNonceForInput(input, prefix) {
    let nonce = 0;
    while (true) {
        // Combining input with the nonce
        let inputStr = input + nonce.toString();
        // Computing the SHA-256 hash of the combined string
        let hash = crypto.createHash('sha256').update(inputStr).digest('hex');
        
        // Checking if the hash starts with the desired prefix
        if (hash.startsWith(prefix)) {
            return { nonce: nonce, hash: hash };
        }
        
        nonce++;
    }
}


const input = 'Dev => Karan | Rs 100\nKaran => Darsh | Rs 10';
const prefix = '00000';  

const result = findNonceForInput(input, prefix);
console.log(`Nonce: ${result.nonce}`);
console.log(`Hash: ${result.hash}`);
