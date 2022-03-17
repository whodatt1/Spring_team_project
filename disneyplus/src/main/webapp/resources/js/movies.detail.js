document.addEventListener("click", (e) => {
  if (e.target.id == "delBtn") {
    e.preventDefault();
    document.querySelector("#delForm").submit();
  }
});

document.getElementById("review").addEventListener("click", (e) => {
  document.getElementById("visiblearea").style.height = "0px";
  document.getElementById("visiblearea").style.overflow = "hidden";
  document.getElementById("visiblearea").style.visibility = "hidden";

  document.getElementById("Rvisible").style.height = "auto";
  document.getElementById("Rvisible").style.overflow = "visible";
  document.getElementById("Rvisible").style.visibility = "visible";
});

document.getElementById("des").addEventListener("click", (e) => {
  document.getElementById("visiblearea").style.height = "auto";
  document.getElementById("visiblearea").style.overflow = "visible";
  document.getElementById("visiblearea").style.visibility = "visible";

  document.getElementById("Rvisible").style.height = "0px";
  document.getElementById("Rvisible").style.overflow = "hidden";
  document.getElementById("Rvisible").style.visibility = "hidden";
});

async function postCharacterToServer(charData) {
  try {
    const url = "/character/post";
    const config = {
      method: "post",
      headers: {
        "Content-Type": "application/json; charset=utf-8",
      },
      body: JSON.stringify(charData),
    };
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;
  } catch (error) {
    console.log(error);
  }
}

async function eraseCharAtServer(mno) {
  try {
    const url = "/character/" + mno;
    const config = {
      method: "delete",
    };
    const resp = await fetch(url, config);
    const result = await resp.text();
    return result;
  } catch (error) {
    console.log(error);
  }
}

document.getElementById("charReg").addEventListener("click", () => {
  const characterName = document.getElementById("charName");
  if (characterName.value == null || characterName.value == "") {
    alert("캐릭터 이름을 입력해 주세요!");
    characterName.focus();
    return false;
  } else {
    let charData = {
      mno: mno,
      characterName: characterName.value,
    };
    postCharacterToServer(charData).then((result) => {
      if (parseInt(result)) {
        alert("캐릭터 등록 성공!");
      }
    });
  }
});

document.getElementById("delChar").addEventListener("click", () => {
  eraseCharAtServer(mno).then((result) => {
    alert("캐릭터 삭제 성공!");
  });
});
