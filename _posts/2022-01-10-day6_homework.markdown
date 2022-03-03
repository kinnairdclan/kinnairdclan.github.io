---
layout: post
title:  "Ruby 1-6: Your Homestead Inventory Tracker"
date:   2022-01-10 00:05:00 -0700
categories: Homework
---

Welcome to your first homework assignment! Unlike previous warmups, I recommend you look at this homework early and often, and get started with more time than you usually would with the warmups.

By the time we hit class Ruby 1-7, have this assignment done and runnable on your virtual environment as a script. If you need any assistance along the way please reach out to me in the chat, I DO have some scaffolding that will get you started if you feel truly stumped.

Assignment
---
For this homework we want to take a load off our brains and have a script keep track of some good in our homestead inventory. Write a script that keeps track of a quantity of goods of your choice, be it cords of wood, bags of flour, gallons of gasoline, or whatever else you can think of. This script should store the quantity of good you have in inventory in a **text file** modified over time as you add to, remove from, or check on your inventory. For simplicity's sake, only have the script work with one type of good stored as a single number in the first line of the text file. I also want to see the text file's name passed into the script as a **command line argument** using `ARGV`.

In the script, the inventory file should be accessed in three different ways, expressed in the following **functions** you create:

1. A `check_inventory` function that *opens* up your inventory file in `'r'` mode, *reads* the number into a variable, and *closes* the inventory file before *returning* the the quanity it found within to the main program as the integer variable. At the top of this function, have it include the following snippet able to catch and return `0` as the quantity found if no file exists:

{% highlight ruby %}
def check_inventory(text_file_name)
  if !File.exist?(text_file_name)
    return 0
  end
  #
  # your code here below
  #
end
{% endhighlight %}
Note: As I've done above, `text_file_name` found via `ARGV` should be passed into all these functions as an **argument**.

{:start="2"}
2. An `add_to_inventory` function that *opens* up our inventory file in `'w'` mode, and modifies the quantity by however much of the item you have added to the inventory using `.to_i` and addition. It then writes the new quantity and closes the file. This function should also not care if the file exists or not, it will create it if it does not exist (because it opens the inventory file in `'w'` mode).

{:start="3"}
3. A `remove_from_inventory` function that does the same thing as `add_to_inventory` but instead takes away stock from your inventory (subtraction). It also interacts with your inventory file in a complete manner, *opening* and *closing* the file on its own. This function should also not care if the file exists or not, it will create it if it does not exist (because it opens the inventory file in `'w'` mode).

{:start="4"}
4. A main body of your script that:
  - Uses `check_inventory` alongside a `puts` statement to tell you how much you have in stock.
  - Asks you how much you added to your stores via `puts`, gets an answer using `$stdin.gets.chomp`, and calls `add_to_inventory` to modify your inventory.
  - Asks you how much you removed from your stores via `puts`, gets an answer using `$stdin.gets.chomp`, and calls `remove_from_inventory` to modify your inventory.
  - Makes a final call to `check_inventory` alongside a `puts` statement to tell you your updated amount in stock.

Say we named our program `take_stock.rb`. The final product should execute at least somewhat like the below:

```
$ ruby ./take_stock.rb gravy.txt 
last time you checked in you had 0 gallons of gravy
how many gallons of gravy did you ladle out since then? enter zero or just RETURN if none.
0 
ok, many gallons of gravy did you make since then? enter zero or just RETURN if none.
120
cool, now you have 120 gallons of gravy
```

Hints
---
**Hint:** In the above execution, we should now have a file called `gravy.txt` sitting in our working directory containing only the number 120.

**Hint:** Work on and test `check_inventory` first, with the above `File.exist?` snippet included. This function should always just open up your file in `'r'` mode and read in the number found within, close the file, and then return either the number or the integer `0` if no file is found. Use it as a convenience function to read in your inventory quanitity to a variable whenever you need it, and use it at the start of your other functions to get the number that you'll be performing arithmetic on.

**Hint:** Don't worry about accidentally going into negative numbers with your script logic, we'll just consider it a side-effect of improper bookkeeping :)

**Hint:** I also wouldn't worry about denominations of your goods in the text file but rather have the `puts` statements consistently output the same denomination e.g. "gallons" or "pounds" or "liters" etc..

Once you have a working program, make a Jekyll post out of your completed homework using [instructions already posted][instructions]. If you can't finish in time post up what you've completed, *and good try!* Coding is trial and error and failure oftentimes, and that is totally OK--it's how we learn.

[instructions]: {{ site.baseurl }}{% link _posts/2021-12-17-day2_warmup.markdown %} 
