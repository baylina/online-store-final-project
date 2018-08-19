- The *require()* function is being used in the two main functions of the contact *OnlineShop.sol* instead of conditionals. It makes the function to fail as soon as possible. It is specially critical in the *buyArticle()* function to use require before calling the  *transfer()* function.

- An emergency stop has been implemented to allow the contract owner to be able to stop and resume the execution of the 2 main important functions *sellArticle()* and *buyArticle()*.

- Contract uses a kill functions that can only be called from the contract owner to *selfdestruct* it and deactivate it from the blockchain

- A basic **Library** called *Strings.sol* has been developed and OnlineShop.sol contact uses its function *_toUpper* to convert strings to uppercase. Test for this function is

- A **speed bump** mechanism has been implemented to prevent, in case it would be necessary, a limit on the execution frequency of the function *buyArticle()* . It is really useful to avoid massive fund withdrawals. If an exploit is found provides time for a solution
