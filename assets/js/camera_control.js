function switchCameraView(view) {
    switch (view) {
        case 'top-down':
            camera.position.set(0, 10, 0);
            camera.lookAt(scene.position);
            break;
        case 'first-person':
            camera.position.set(0, 2, 5);
            camera.lookAt(scene.position);
            break;
        default:
            return;
    }
}
