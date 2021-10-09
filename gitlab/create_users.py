import gitlab
import pandas as pd
import logging


# 批量注册账号 - 密码为给定邮箱
if __name__ == '__main__':
    gl = gitlab.Gitlab('http://your-git-repo-address', private_token='your-private_token')
    gl.auth()

    users = pd.read_excel('./template.xlsx')

    users = users.dropna(axis=0, subset=["邮箱"])

    # 创建的用户密码与邮箱相同，当登录后会被自动要求修改密码
    for _, user in users.iterrows():
        print(user['用户名'], user['账号'], user['邮箱'])
        user = gl.users.create({'email': user['邮箱'],
                                'password': user['邮箱'],
                                'username': user['账号'],
                                'name': user['用户名'],
                                'skip_confirmation': True})
        user.save()
        print(user)

    logging.info("done!")