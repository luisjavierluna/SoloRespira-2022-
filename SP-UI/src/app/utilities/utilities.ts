export function toBase64(file: File){
    return new Promise<string>((resolve, reject) => {
        const reader = new FileReader()
        reader.readAsDataURL(file)
        reader.onload = () => resolve(reader.result as string)
        reader.onerror = (error) => reject(error)
    })
}

export function parseAPIErrors(response: any): string[] {
    // console.log(response) // Use when the errors are not displayed after a wrong validation
    const result: string[] = []

    if(response.error) {
        if(typeof response.error === 'string'){
            result.push(response.error)
        } else if (Array.isArray(response.error)) {
            response.error.array.forEach((value: any) => result.push(value.description))
        }
        else {
            const errorsMap = response.error.errors
            const entries = Object.entries(errorsMap)
            entries.forEach((arrayVariable: any[]) => {
                arrayVariable[1].forEach((errorMessage: any) => {
                    result.push(`${errorMessage}`)
                })
            })
        }
    }

    return result
}