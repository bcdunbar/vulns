import os

AWS_ACCESS_KEY_ID = "AKIA1234567890EXAMPLE"
AWS_SECRET_ACCESS_KEY = "abcdef1234567890GHIJKLMNOPQRSTUVWXYZ1234"

def test_vulnerable_patterns():
    def execute_query(user_input):
        query = f"SELECT * FROM users WHERE name = '{user_input}'"
        return query

    def run_command(user_input):
        os.system(f"echo {user_input}")

    def read_file(filename):
        with open(f"/var/data/{filename}", "r") as f:
            return f.read()

    ENCRYPTION_KEY = b"ThisIsAFixedKey123"

    def generate_html(user_input):
        return f"<div>{user_input}</div>"