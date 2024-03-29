//
//  ProgramDescriptionStorage.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 18/1/23.
//

import Foundation

struct ProgramDescriptionStorage {
   static let programArray = [
    ProgramDescription(programName: "ECD/BEFIT TRAINING PLAN", programDetail: "The general plan for training in the GYM or CROSSFIT BOX", cellImage: "general"),
    ProgramDescription(programName: "BODYWEIGHT PLAN", programDetail: "The bodyweight training plan which can be followed anywhere, no equipment required", cellImage: "bodyweight"),
    ProgramDescription(programName: " 'STRUYACH' PLAN", programDetail: "The training plan crafted for experienced athlets", cellImage: "athlete"),
    ProgramDescription(programName: "BADASS", programDetail: "The 10 workouts plan for butt and legs", cellImage: "butt"),
    ProgramDescription(programName: "HARD PRESS", programDetail: "The 10 workouts plan for abs", cellImage: "abs")
   ]
}

