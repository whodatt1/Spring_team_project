document.getElementById('trigger').addEventListener('click', () => {
    document.getElementById('files').click();
});

const regExp = new RegExp("\.(exe|sh|bat|js|msi|dll)$");
const regExpImg = new RegExp("\.(jpg|jpeg|png|gif)$");
const maxSize = 1024 * 1024;
function fileSizeValidation(fileName, fileSize) {
    if (regExp.test(fileName)) {
        return 0;
    } else if (!regExpImg.test(fileName)) {
        return 0;
    } else if (maxSize < fileSize) {
        return 0;
    } else {
        return 1;
    }
}

document.addEventListener('change', (e) => {
    if (e.target.id == 'files') {
        document.getElementById('regBtn').disabled = false;

        const fileObjects = document.getElementById('files').files;

        let div = document.getElementById('fileZone');
        div.innerHTML = '';
        let ul = '<ul class="list-group list-group-flush">';
        let isOk = 1;
        for (let file of fileObjects) {
            let validResult = fileSizeValidation(file.name, file.size);
            isOk *= validResult;
            ul += `<li class="list-group-item d-flex justify-content-between align-items-start my-bg mb-3" style="color: white; border-radius: 4px;">`;
            ul += `<div class="ms-2 me-auto">`
            ul += `${validResult ? '<div class="fw-bold text-success">업로드 가능' : '<div class="fw-bold text-danger">업로드 불가'}</div>`;
            ul += `${file.name}</div>`;
            ul += `<span class="badge bg-${validResult ? 'success' : 'danger'}" style="border-radius: 4px;">${file.size} Bytes</span></li>`;
        }
        ul += '</ul>';
        div.innerHTML = ul;
        if (isOk == 0) {
            document.getElementById('regBtn').disabled = true;
        }
    }
});