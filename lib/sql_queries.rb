# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts
"SELECT title, SUM(amount) FROM projects
JOIN pledges on projects.id = pledges.project_id
GROUP BY title;"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges
"SELECT users.name, users.age, SUM(pledges.amount) from pledges
JOIN users on users.id = pledges.user_id
GROUP BY users.id
ORDER BY users.name"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
"SELECT title, total_raised - funding_goal FROM (
SELECT title, SUM(pledges.amount) as total_raised, funding_goal FROM projects
JOIN pledges on pledges.project_id = projects.id
GROUP BY projects.id)a
WHERE a.total_raised >= a.funding_goal;"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount
"SELECT users.name, SUM(pledges.amount) from pledges
join users on users.id = pledges.user_id
group by users.id
order by SUM(pledges.amount), users.name;"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
"select projects.category, pledges.amount from projects
join pledges on pledges.project_id = projects.id
where projects.category = 'music';"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_book_category
  "select projects.category, sum(pledges.amount) from projects
  join pledges on pledges.project_id = projects.id
  where projects.category = 'books'
  group by projects.category;"
end
