import os

def execute_query(user_input):
    query = f"SELECT * FROM users WHERE name = '{user_input}'"
    return query