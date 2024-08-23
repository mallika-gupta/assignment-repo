# assignment-repo
Blockchain Lab Assignment 

## Contracts Overview

### 1. Hello World Contract
- **File:** `q1.sol`
- **Description:** Returns a static message "Hello, World!".
- **Features:**
  - A single function to return the message.

### 2. Simple Storage
- **File:** `q2.sol`
- **Description:** Allows storing and retrieving a single integer value.
- **Features:**
  - `set(uint256 _value)`: Stores an integer.
  - `get()`: Retrieves the stored integer.

### 3. Greeting Contract
- **File:** `q3.sol`
- **Description:** Allows users to set and get a personalized greeting message.
- **Features:**
  - `setGreeting(string memory _greeting)`: Sets a custom greeting.
  - `getGreeting()`: Retrieves the greeting message.

### 4. Simple Counter
- **File:** `q4.sol`
- **Description:** Maintains a counter that can be incremented.
- **Features:**
  - `increment()`: Increments the counter.
  - `getCounter()`: Retrieves the counter value.

### 5. Name Storage
- **File:** `q5.sol`
- **Description:** Stores and retrieves a user’s name.
- **Features:**
  - `setName(string memory _name)`: Stores the name.
  - `getName()`: Retrieves the name.

### 6. Basic Voting
- **File:** `q6.sol`
- **Description:** Facilitates voting for candidates and tracks vote counts.
- **Features:**
  - `vote(string memory _candidate)`: Votes for a candidate.
  - `getVotes(string memory _candidate)`: Retrieves the vote count.

### 7. Owner Access
- **File:** `q7.sol`
- **Description:** Restricts certain functions to the contract owner.
- **Features:**
  - Includes access control for specific functions.

### 8. Event Logging
- **File:** `q8.sol`
- **Description:** Logs events when actions are performed.
- **Features:**
  - Emits events for certain functions.

### 9. Simple Ledger
- **File:** `q9.sol`
- **Description:** Maintains a ledger of transaction entries.
- **Features:**
  - Adds and retrieves ledger entries.

### 10. Message Storage
- **File:** `q10.sol`
- **Description:** Stores and retrieves a message string.
- **Features:**
  - `setMessage(string memory _message)`: Stores a message.
  - `getMessage()`: Retrieves the stored message.
