import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import static com.kms.katalon.core.testobject.ObjectRepository.findWindowsObject
import com.kms.katalon.core.checkpoint.Checkpoint as Checkpoint
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling as FailureHandling
import com.kms.katalon.core.testcase.TestCase as TestCase
import com.kms.katalon.core.testdata.TestData as TestData
import com.kms.katalon.core.testobject.TestObject as TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import com.kms.katalon.core.windows.keyword.WindowsBuiltinKeywords as Windows
import internal.GlobalVariable as GlobalVariable
import org.openqa.selenium.Keys as Keys

WebUI.openBrowser('')

WebUI.navigateToUrl('https://evermos.com/home/')

WebUI.click(findTestObject('Page_Beranda/form login'))

// test case 1.0.2	kedua field kosong

WebUI.click(findTestObject('Page_Login/button_login'))

WebUI.verifyElementPresent(findTestObject('Page_Login/notif_Nomor telepon harus di isi'),3,FailureHandling.OPTIONAL)

WebUI.verifyElementPresent(findTestObject('Page_Login/notif_Kata sandi harus di isi'),3,FailureHandling.OPTIONAL)


// test case 1.0.3	username kosong

WebUI.setEncryptedText(findTestObject('Page_Login/input_login_Kata Sandi'),
	'NOZHw6sL/1I=')

WebUI.click(findTestObject('Page_Login/button_login'))
WebUI.verifyElementPresent(findTestObject('Page_Login/notif_Nomor telepon harus di isi'),3,FailureHandling.OPTIONAL)


// test 1.0.4	password kosong

WebUI.sendKeys(findTestObject('Page_Login/input_login_Kata Sandi'), Keys.chord(Keys.CONTROL, 'a'))
WebUI.sendKeys(findTestObject('Page_Login/input_login_Kata Sandi'), Keys.chord(Keys.BACK_SPACE))
WebUI.setText(findTestObject('Page_Login/input_login_Nomor Telepon'),
	'1223334444')
WebUI.click(findTestObject('Page_Login/button_login'))
WebUI.verifyElementPresent(findTestObject('Page_Login/notif_Kata sandi harus di isi'),3,FailureHandling.OPTIONAL)


//1.0.6	username salah

WebUI.setEncryptedText(findTestObject('Page_Login/input_login_Kata Sandi'), 
    'NOZHw6sL/1I=')

WebUI.click(findTestObject('Page_Login/button_login'))

WebUI.verifyElementPresent(findTestObject('Page_Login/notif_no telp belum terdaftar'),3,FailureHandling.OPTIONAL)


// 1.0.7	password salah
WebUI.sendKeys(findTestObject('Page_Login/input_login_Nomor Telepon'), Keys.chord(Keys.CONTROL, 'a'))
WebUI.sendKeys(findTestObject('Page_Login/input_login_Nomor Telepon'), Keys.chord(Keys.BACK_SPACE))
WebUI.setText(findTestObject('Page_Login/input_login_Nomor Telepon'),
	'621223334444')
WebUI.verifyElementPresent(findTestObject('Page_Login/notif_Nomor Telepon atau Kata Sandi salah'),3,FailureHandling.OPTIONAL)

// 1.0.1	login positive case
WebUI.sendKeys(findTestObject('Page_Login/input_login_Nomor Telepon'), Keys.chord(Keys.CONTROL, 'a'))
WebUI.sendKeys(findTestObject('Page_Login/input_login_Nomor Telepon'), Keys.chord(Keys.BACK_SPACE))
WebUI.sendKeys(findTestObject('Page_Login/input_login_Kata Sandi'), Keys.chord(Keys.CONTROL, 'a'))
WebUI.sendKeys(findTestObject('Page_Login/input_login_Kata Sandi'), Keys.chord(Keys.BACK_SPACE))

WebUI.setText(findTestObject('Page_Login/input_login_Nomor Telepon'), 
    '621223334444')
WebUI.setEncryptedText(findTestObject('Page_Login/input_login_Kata Sandi'),
	'8SQVv/p9jVScEs4/2CZsLw==')

WebUI.click(findTestObject('Page_Login/button_login'))
WebUI.verifyElementPresent(findTestObject('Page_Evermos - Katalog/button_SEARCH'),3,FailureHandling.OPTIONAL)

WebUI.verifyElementPresent(findTestObject('Page_Evermos - Katalog/input_search'),3,FailureHandling.OPTIONAL)
WebUI.click(findTestObject('Page_Evermos - Katalog/button_SEARCH'))

