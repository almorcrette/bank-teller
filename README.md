# Bank Teller 

Ruby bank teller program developed to practise doing a tech test. Developed during week 9 of Makers Academy which focuses on code quality.

## Client requirements

* Able to interact with doe via a REPL
* Deposits, withdrawals
* Account statement (date, amount, balance) printing
* Data can be kept in memory

### Acceptance criteria

**Given** a client makes a de[posit of 1000 on 10-01-2023
**And** a deposit of 2000 on 13-01-2023
**And** a withdrawal of 500 on 14-01-2023
**When** she prints her bank statement
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## Solution design approach

### 1. User stories

First I unpack the requirements into user stories: 

```
As a customer
so that I can keep my money safe
I want to deposit money into my account

As a customer
So that I can spend my money
I want to withdraw money from my account

As a customer
So that I can check my balance
I want to print an account statement with my balance on it

As a customer
So that I can keep track of my transactions
I want my account statement to include all transactions with their dates
```

### 2. Domain model

Secondly, I use domain modelling to diagram an object-oriented design to deliver the features set out in the user stories. I use Excalidraw as it is uncomplicated with unnecessary features, and creates nice-looking diagrams quickly.

![](assets/bank-teller-v1.excalidraw.png)

Principles I aim to follow for the design are:
- Each object does one thing and one thing well
- Keep it super simple (KISS): Avoid unnecessary complexity
- You Ain't Gonna Need It (YAGNI): Do the simplest thing that could possibly work and avoid adding functionality until deemed necessary
- Principle of least astonishment (POLA): A component of a system should behave in a way that most users will expect it to behave.





## Code structure

### Dependencies

For development and testing:
* `rspec`
* `rubocop`, `1.20`, using [Makers Academy Scaffolint linter file](https://github.com/makersacademy/scaffolint)

## Usage

### Getting started (installing the code)

`git clone path-to-your-repo`
`command_to_install_dependencies` (e.g. `bundle`)

### Usage (executing the program)

`command_to_start` (e.g. `rackup` or `rails s`)
Navigate to `http://localhost:4567/`

### Running tests

`test_command` (e.g. `rspec`)

## Potential future extensions