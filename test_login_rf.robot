*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      <https://scouts-test.futbolkolektyw.pl/en>;
${BROWSER}        Chrome
${SIGNINBUTTON}      xpath=//*[(text()='Sign in')]
${EMAILINPUT}        xpath=//*[@id='Login']
${PASSWORDINPUT}      xpath=//*[@id='Password']
${PAGELOGO}        xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]

*** Test Cases ***
Login to the system
Open login page
Type in email
Type in password
Click on the Submit bitton
Assert dashboard
[Teardown] Close Browser


*** Keywwords ***
Open login page
    Open Browser    ${LOGIN URL}        ${BROWSER}
    Title Should Be         Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}       user09@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}  Test-1234
Click on the Submit button
    Click Element       xpath=//*[(text()='Sign in')]
Assert dashboard
    Wait Until Element Is Visible    ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot    alert.png
[Teardown] Close Browser

Test Title
    [Tags]  DEBUG
    Provided precondition
    When action
    Then check expectations

*** Keywords ***
    Provided precondition
    Setup system under test


class TestLoginPage (unittest. TestCases):


    @classmethod
    def setUp(self):
        os.chmod(DRIVER_PATH, 755)
        self.driver_service = Service(executable_path=DRIVER_PATH)
        self.driver = webdriver.Chrome(service=self.driver_service)
        self.driver.get('https://scouts-test.futbolkolektyw.pl/en') #open the website
        self.driver.fullscreen_window() #open a browser window in full size mode
        self.driver.implicitly_wait(IMPLICITLY_WAIT) #wait before you start testing

    def test_log_in_to_the_system(self):
        user_login = LoginPage(self.driver)
        user.login.title_of_the_page() #check if the title of the opened page is correct
        user_login.type_in_email('user09@getnada.com') #enter 'user09@getnada.com' in the email field
        user_login.type_in_password('Test-1234') #eneter 'Test-1234' in the passord field
        user.login.wait_for_button_will_be_clicable() #wait for the button to be clickable
        user.login.click_on_the_sign_in_button() #click on the sign in button
        dashborad_page =Dashboard(self, driver)
        dashboard_page.title_of_page() #check if the title of the opened page is correct



    @classmethod
    def tearDown(self):
        self.driver.quit() #close the browser after the test