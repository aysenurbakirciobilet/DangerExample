import Danger
import Foundation

let danger = Danger()

// Dosya değişikliklerini al
let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles

// Büyük PR kontrolü
if editedFiles.count - danger.git.deletedFiles.count > 300 {
    danger.warn("Big PR: This pull request contains a large number of changes. Try to keep changes smaller if possible.")
}

// PR açıklaması kontrolü
let body = danger.github?.pullRequest.body?.count ?? 0
let linesOfCode = danger.github?.pullRequest.additions ?? 0
if body < 10 && linesOfCode > 10 {
    danger.warn("PR Description Needed: Please provide a more detailed summary of your changes.")
}

// WIP kontrolü
if let prTitle = danger.github?.pullRequest.title, prTitle.contains("WIP") {
    danger.warn("Work in Progress: This PR is marked as a work in progress.")
}

// Dosyaları yazdır (hata ayıklama için)
//print("Modified Files: \(editedFiles)")
//print("Deleted Files: \(danger.git.deletedFiles)")
