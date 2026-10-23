//
//  ViewController.swift
//  lab3 (Deni)
//
//  Created by stud on 16.10.2026.
//


import UIKit

class Student {
    var name = ""
    var surname = ""
    var course = 1
    var needsDormitory = false

    func showInfo() {
        print("Ім'я: \(name)")
        print("Прізвище: \(surname)")
        print("Курс: \(course)")

        if needsDormitory {
            print("Гуртожиток потрібен")
        } else {
            print("Гуртожиток не потрібен")
        }
    }
}

class ViewController: UIViewController,
                      UIPickerViewDataSource,
                      UIPickerViewDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var dormitorySwitch: UISwitch!
    @IBOutlet weak var coursePicker: UIPickerView!
    @IBOutlet weak var profileImage: UIImageView!

    let courses = ["1 курс", "2 курс", "3 курс", "4 курс"]
    let student = Student()

    override func viewDidLoad() {
        super.viewDidLoad()

        coursePicker.dataSource = self
        coursePicker.delegate = self

        profileImage.image = UIImage(
            systemName: "person.crop.circle.fill"
        )
        profileImage.contentMode = .scaleAspectFit
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(
        _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
    ) -> Int {
        return courses.count
    }

    func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String? {
        return courses[row]
    }

    @IBAction func saveTapped(_ sender: UIButton) {
        view.endEditing(true)

        student.name = nameField.text ?? ""
        student.surname = surnameField.text ?? ""
        student.course = coursePicker.selectedRow(inComponent: 0) + 1
        student.needsDormitory = dormitorySwitch.isOn

        student.showInfo()

        let message = UIAlertController(
            title: "Готово",
            message: "Дані анкети виведено в консоль.",
            preferredStyle: .alert
        )

        message.addAction(UIAlertAction(
            title: "OK",
            style: .default
        ))

        present(message, animated: true)
    }
}
