//
// Run this from the Run menu or press F5

// vulnerableFunction constructs an SQL query by 
// directly concatenating the userInput into the query string 
// without proper sanitation or parameterization.
function vulnerableFunction(userInput : String) : String {
        var query : String = "SELECT * FROM Users WHERE Username = '" + userInput + "'" // Concatenation of User Input
        // Lack of Sanitization - No sanitization or validation of the userInput variable before it's used in the query. 
        // As a result, any user-provided input, including maliciously crafted SQL code, is directly inserted into the query string.
        return query
    }
var safeInput : String = "Alice" // Safe input
var maliciousInput : String = "'; DROP TABLE Users; --" 
// When maliciousInput is passed to the function the resulting query string is 
// SELECT * FROM Users WHERE Username = ''; DROP TABLE Users; --
// which deletes the user table and damages data 

var safeResult : String = vulnerableFunction(safeInput)
var maliciousResult : String = vulnerableFunction(maliciousInput)

print("Safe Result: " + safeResult)
print("Malicious Result: " + maliciousResult)
//The fix for this type of vulnerability is using parameterized queries or prepared statements 
// Rather than directly concatenating user input into the SQL query.     