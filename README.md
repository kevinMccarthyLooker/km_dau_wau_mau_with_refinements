# Readme

### Step 1 - Add the block reference to your manifest.lkml file:

        remote_dependency: dau_wau_mau_support__remote_dependency {
          url: "git://github.com/kevinMccarthyLooker/dau_wau_mau_support.git"
          ref: "master"
        }

### Step 2 - Include the block and extend it onto your explore:

#### Step 2a - Paste the following lookml above your explore definition

        include: "//dau_wau_mau_support__remote_dependency/dau_wau_mau_support.view"
        view: +dau_wau_mau_support {
          dimension: date_to_use__input_field {sql:${UPDATE_ME__VIEW_NAME.UPDATE_ME__DATE_FIELD};;}
          dimension: user_id__input_field {sql:${UPDATE_ME__VIEW_NAME.UPDATE_ME__UNIQUE_USER_ID};;}
        }

#### Step 2b - Update the UPDATE_MEs in the code you pasted to point to existing fields in your explore

#### Step 2c - Add

        extends: [dau_wau_mau_support]

to your explore
