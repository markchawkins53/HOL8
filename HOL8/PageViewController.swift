//
//  PageViewController.swift
//  HOL8
//
//  Created by Mark Hawkins on 2/6/20.
//  Copyright © 2020 Revature. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate  = self
     
        if let firstVC = pages.first {
          setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
     
    // Do any additional setup after loading the view.
    }
    
    fileprivate lazy var pages: [UIViewController] = {
    return [
      self.getViewController(withIdentifier: "Mark"),
      self.getViewController(withIdentifier: "Kyle"),
      self.getViewController(withIdentifier: "Dane"),
      self.getViewController(withIdentifier: "Wes"),
      self.getViewController(withIdentifier: "Jeremy"),
      self.getViewController(withIdentifier: "Nathan"),
      self.getViewController(withIdentifier: "Kjay")
    ]
    }()

    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
    }
    */
    }

    extension PageViewController: UIPageViewControllerDataSource {
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

            guard let viewControllerIndex = pages.index(of: viewController) else { return nil }

            let previousIndex = viewControllerIndex - 1

            guard previousIndex >= 0 else { return pages.last }

            guard pages.count > previousIndex else { return nil }

            return pages[previousIndex]
        }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

            guard let viewControllerIndex = pages.index(of: viewController) else { return nil }

            let nextIndex = viewControllerIndex + 1

            guard nextIndex < pages.count else { return pages.first }

            guard pages.count > nextIndex else { return nil }

            return pages[nextIndex]
        }
    }

    extension PageViewController: UIPageViewControllerDelegate { }
