import argparse
from connect_db import connection

parser = argparse.ArgumentParser(description='py get_from_db.py -s query_01.sql')

parser.add_argument('-s', '--sql', type=str, required=False, help='py get_from_db.py -s query_01.sql')
args = parser.parse_args()

def main():
    try:
        if args.sql:
            with open(args.sql, 'r', encoding='utf-8') as fh:
                sql_query = fh.read()
                fh.seek(0)
                for line in fh:
                    if "--" in line:
                        comment = line.split("--")[1]
                        print("Comment:", comment.strip())

        with connection() as conn:
            c = conn.cursor()
            c.execute(sql_query)
            datas = c.fetchall()
            count = 0
            for el in datas:
                count += 1
                print(count, el)
                
            c.close()
    except FileNotFoundError as error:
        print('File not found:', error)
    except Exception as error1:
        print('An error occurred:', error1)


if __name__ == "__main__":
    main()