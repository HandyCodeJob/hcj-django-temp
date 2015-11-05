from test_plus.test import TestCase

from ..admin import MyUserCreationForm


class TestMyUserCreationForm(TestCase):

    def setUp(self):
        self.user = self.make_user()

    def test_clean_username_success(self):
        # Instantiate the form with a new username
        form = MyUserCreationForm({
            'email': 'alamode@example.com',
            'password1': '123456',
            'password2': '123456',
        })
        # Run is_valid() to trigger the validation
        valid = form.is_valid()
        self.assertTrue(valid)

        # Run the actual clean_username method
        email = form.clean_email()
        self.assertEqual('alamode@example.com', email)

    def test_clean_username_false(self):
        # Instantiate the form with the same username as self.user
        form = MyUserCreationForm({
            'email': self.user.email,
            'password1': '123456',
            'password2': '123456',
        })
        # Run is_valid() to trigger the validation, which is going to fail
        # because the username is already taken
        valid = form.is_valid()
        self.assertFalse(valid)

        # The form.errors dict should contain a single error called 'username'
        self.assertTrue(len(form.errors) == 1)
        self.assertTrue('email' in form.errors)
