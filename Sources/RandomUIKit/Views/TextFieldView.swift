//
//  TextFieldView.swift
//
//  Created by Vitalii Sosin on 02.05.2022.
//

import UIKit

/// View для экрана
public final class TextFieldView: UITextField {
  
  // MARK: - Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    applyDefaultBehavior()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Private func
  
  private func applyDefaultBehavior() {
    backgroundColor = RandomColor.primaryWhite
    borderStyle = .roundedRect
    textAlignment = .center
    font = RandomFont.primaryRegular16
  }
}

// MARK: - Appearance

private extension TextFieldView {
  struct Appearance {
    
  }
}
