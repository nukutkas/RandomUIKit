//
//  File.swift
//  
//
//  Created by Никита Кочетов on 25.02.2023.
//

import UIKit

/// View для экрана
public final class TextFieldMultilineView: UITextView{

  // MARK: - Initialization

  public override init(frame: CGRect, textContainer: NSTextContainer?) {
    super.init(frame: frame, textContainer: textContainer)
    applyDefaultBehavior()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Private func

  private func applyDefaultBehavior() {
    let appearance = Appearance()

    layer.borderWidth = appearance.borderWidth
    layer.borderColor = RandomColor.darkAndLightTheme.primaryGray.cgColor
    layer.cornerRadius = appearance.cornerRadius
    clipsToBounds = true

    backgroundColor = RandomColor.darkAndLightTheme.primaryWhite
    textAlignment = .center
    font = RandomFont.primaryRegular16
    textColor = RandomColor.darkAndLightTheme.primaryGray
  }
}

// MARK: - Appearance

private extension TextFieldMultilineView {
  struct Appearance {
    let cornerRadius: CGFloat = 8
    let borderWidth: CGFloat = 1
  }
}

