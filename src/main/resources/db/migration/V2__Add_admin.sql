insert into usr (id, username, password, active)
    values (1, 'admin', '$2a$08$2l/uSwQDlknuRz7R1nw4MuOcJHhxs2V55cR9t851P8yTNsCBB6Qw2', true);

insert into user_role (user_id, roles)
    values (1, 'USER'), (1, 'ADMIN')
