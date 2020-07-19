Assessment 3

Instructions 
1. Have a look at the following website and familiarise yourself with the database schema that is represented there: 
https://data.stackexchange.com/stackoverflow/query/new 
2. Answer the following questions and provide your underlying SQL queries where applicable. 

Questions 
1. How many users does this database contain? 
    SELECT COUNT(Id) As UserCount
    FROM Users

2. How many users were created each calendar year (since the beginning of 2010) in this database?
    SELECT COUNT(Id) As Count, DATEPART(yyyy, [CreationDate]) As Year
    FROM Users
    WHERE DATEPART(yyyy, [CreationDate]) > 2009
    GROUP BY DATEPART(yyyy, [CreationDate])
    ORDER BY Year ASC

3. How many posts of type "Question" has the user "Mat Mannion" asked since he joined? 
    SELECT COUNT(p.Id) As Questions
    FROM Users u
    JOIN Posts p
    ON p.OwnerUserId = u.Id
    JOIN PostTypes pt
    ON pt.Id = p.PostTypeId
    WHERE u.DisplayName = 'Mat Mannion'
    AND pt.Name = 'Question'

4. What is the name of the most reputable "South Africa" user and how many "Enlightened" badges did they receive in 2016? 
    SELECT (SELECT u3.DisplayName FROM Users u3 WHERE u3.Id = b.UserId) As Username, COUNT(b.Id) As Enlightenments, DATEPART(yyyy, b.[Date]) As Year
    FROM Users u
    JOIN Badges b
    ON b.UserId = u.Id
    WHERE u.Reputation = (SELECT MAX(u2.Reputation) As Rep
        FROM Users u2
        WHERE u2.Location = 'South Africa')
    AND b.Name = 'Enlightened'
    AND DATEPART(yyyy, b.[Date]) = 2016
    GROUP BY b.UserId, DATEPART(yyyy, b.[Date])

5. Provide another query that returns the same result as the question above. Which is the more optimal query and why?
    SELECT TOP 1 u.DisplayName As Username, COUNT(b.Name) As Enlightenments, DATEPART(yyyy, b.[Date]) As Year
    FROM Users u
    JOIN Badges b
    ON b.UserId = u.Id
    WHERE u.Location = 'South Africa'
    AND b.Name = 'Enlightened'
    AND DATEPART(yyyy, b.[Date]) = 2016
    GROUP BY b.Name, DATEPART(yyyy, b.[Date]), u.DisplayName, u.Reputation
    ORDER BY u.Reputation DESC

    Both queries run about the same amount of time. 4 Should run faster, because less groupings are made in 4.

6. Did you have to make any assumptions in the queries above? If you did, what were they and what was your thinking? 
    4. Assumption that if there are 2 with the highest reputation, either one would do because the question does not specify how to handle duplicates.
